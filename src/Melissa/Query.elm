-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Melissa.Query exposing (..)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)
import Melissa.InputObject
import Melissa.Interface
import Melissa.Object
import Melissa.Scalar
import Melissa.ScalarCodecs
import Melissa.Union


type alias OrdersOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument Int
    }


orders :
    (OrdersOptionalArguments -> OrdersOptionalArguments)
    -> SelectionSet decodesTo Melissa.Object.OrderConnection
    -> SelectionSet decodesTo RootQuery
orders fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { first = Absent, after = Absent }

        optionalArgs____ =
            [ Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "after" filledInOptionals____.after Encode.int ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "orders" optionalArgs____ object____ Basics.identity