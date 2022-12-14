-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Melissa.Object.PageInfo exposing (..)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Melissa.InputObject
import Melissa.Interface
import Melissa.Object
import Melissa.Scalar
import Melissa.ScalarCodecs
import Melissa.Union


startCursor : SelectionSet (Maybe Melissa.ScalarCodecs.Id) Melissa.Object.PageInfo
startCursor =
    Object.selectionForField "(Maybe ScalarCodecs.Id)" "startCursor" [] (Melissa.ScalarCodecs.codecs |> Melissa.Scalar.unwrapCodecs |> .codecId |> .decoder |> Decode.nullable)


endCursor : SelectionSet (Maybe Melissa.ScalarCodecs.Id) Melissa.Object.PageInfo
endCursor =
    Object.selectionForField "(Maybe ScalarCodecs.Id)" "endCursor" [] (Melissa.ScalarCodecs.codecs |> Melissa.Scalar.unwrapCodecs |> .codecId |> .decoder |> Decode.nullable)
