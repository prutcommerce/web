module App.Shared.ProductGraphQl exposing (..)

import Artemis.Object
import Artemis.Object.Product as Product
import Artemis.Object.ProductConnection as Connection
import Artemis.Object.ProductEdge as Edge
import Artemis.Query as Query exposing (ProductsOptionalArguments)
import Artemis.Scalar exposing (Id(..))
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, with)


type alias ProductNode =
    { id : String
    , name : String
    }


type alias ProductEdge =
    { node : ProductNode
    }


type alias ProductConnection =
    { edges : List ProductEdge
    }


fromId : Artemis.Scalar.Id -> String
fromId id =
    case id of
        Id string ->
            string


nodeSelection : SelectionSet ProductNode Artemis.Object.Product
nodeSelection =
    SelectionSet.succeed ProductNode
        |> with (Product.id |> SelectionSet.map fromId)
        |> with Product.name


edgeSelection : SelectionSet ProductEdge Artemis.Object.ProductEdge
edgeSelection =
    SelectionSet.succeed ProductEdge
        |> with (Edge.node nodeSelection)


connectionSelection : SelectionSet ProductConnection Artemis.Object.ProductConnection
connectionSelection =
    SelectionSet.succeed ProductConnection
        |> with (Connection.edges edgeSelection)


arguments : ProductsOptionalArguments -> ProductsOptionalArguments
arguments _ =
    { first = Present 10, after = Absent }


query : SelectionSet ProductConnection RootQuery
query =
    Query.products arguments connectionSelection
