module App.Shared.OrderGraphQL exposing (..)

import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, with)
import Melissa.Object
import Melissa.Object.Order as Order
import Melissa.Object.OrderConnection as Connection
import Melissa.Object.OrderEdge as Edge
import Melissa.Query as Query exposing (OrdersOptionalArguments)
import Melissa.Scalar exposing (Id(..))


type alias OrderNode =
    { id : String
    , productId : String
    , quantity : String
    , status : String
    }


type alias OrderEdge =
    { node : OrderNode
    }


type alias OrderConnection =
    { edges : List OrderEdge }


fromId : Melissa.Scalar.Id -> String
fromId id =
    case id of
        Id string ->
            string


nodeSelection : SelectionSet OrderNode Melissa.Object.Order
nodeSelection =
    SelectionSet.succeed OrderNode
        |> with (Order.id |> SelectionSet.map fromId)
        |> with Order.quantity
        |> with Order.status
        |> with (Order.productId |> SelectionSet.map fromId)


edgeSelection : SelectionSet OrderEdge Melissa.Object.OrderEdge
edgeSelection =
    SelectionSet.succeed OrderEdge
        |> with (Edge.node nodeSelection)


connectionSelection : SelectionSet OrderConnection Melissa.Object.OrderConnection
connectionSelection =
    SelectionSet.succeed OrderConnection
        |> with (Connection.edges edgeSelection)


arguments : OrdersOptionalArguments -> OrdersOptionalArguments
arguments _ =
    { first = Present 10, after = Absent }


query : SelectionSet OrderConnection RootQuery
query =
    Query.orders arguments connectionSelection
