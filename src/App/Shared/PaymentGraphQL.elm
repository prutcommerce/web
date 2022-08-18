module App.Shared.PaymentGraphQL exposing (..)

import Evander.Mutation as Mutation exposing (CreatePaymentRequiredArguments)
import Evander.Object
import Evander.Object.Payment as Payment
import Evander.Object.PaymentConnection as Connection
import Evander.Object.PaymentEdge as Edge
import Evander.Query as Query exposing (PaymentsOptionalArguments)
import Evander.Scalar exposing (Id(..))
import Graphql.Operation exposing (RootMutation, RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, with)


type alias PaymentNode =
    { id : String
    , orderId : String
    , status : String
    }


type alias PaymentEdge =
    { node : PaymentNode
    }


type alias PaymentConnection =
    { edges : List PaymentEdge
    }


fromId : Evander.Scalar.Id -> String
fromId id =
    case id of
        Id string ->
            string


nodeSelection : SelectionSet PaymentNode Evander.Object.Payment
nodeSelection =
    SelectionSet.succeed PaymentNode
        |> with (Payment.id |> SelectionSet.map fromId)
        |> with (Payment.orderId |> SelectionSet.map fromId)
        |> with Payment.status


edgeSelection : SelectionSet PaymentEdge Evander.Object.PaymentEdge
edgeSelection =
    SelectionSet.succeed PaymentEdge
        |> with (Edge.node nodeSelection)


connectionSelection : SelectionSet PaymentConnection Evander.Object.PaymentConnection
connectionSelection =
    SelectionSet.succeed PaymentConnection
        |> with (Connection.edges edgeSelection)


arguments : PaymentsOptionalArguments -> PaymentsOptionalArguments
arguments _ =
    { first = Present 100, after = Absent }


query : SelectionSet PaymentConnection RootQuery
query =
    Query.payments arguments connectionSelection


mutationArguments : String -> String -> String -> Int -> Int -> CreatePaymentRequiredArguments
mutationArguments id cardNumber cardCvv cardExpiryYear cardExpiryMonth =
    { payment = { orderId = Id id, cardNumber = cardNumber, cardCvv = cardCvv, cardExpiryYear = cardExpiryYear, cardExpiryMonth = cardExpiryMonth } }


mutation : String -> String -> String -> Int -> Int -> SelectionSet PaymentNode RootMutation
mutation id cardNumber cardCvv cardExpiryYear cardExpiryMonth =
    Mutation.createPayment (mutationArguments id cardNumber cardCvv cardExpiryYear cardExpiryMonth) nodeSelection
