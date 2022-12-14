-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Evander.Object.PageInfo exposing (..)

import Evander.InputObject
import Evander.Interface
import Evander.Object
import Evander.Scalar
import Evander.ScalarCodecs
import Evander.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


startCursor : SelectionSet (Maybe Evander.ScalarCodecs.Id) Evander.Object.PageInfo
startCursor =
    Object.selectionForField "(Maybe ScalarCodecs.Id)" "startCursor" [] (Evander.ScalarCodecs.codecs |> Evander.Scalar.unwrapCodecs |> .codecId |> .decoder |> Decode.nullable)


endCursor : SelectionSet (Maybe Evander.ScalarCodecs.Id) Evander.Object.PageInfo
endCursor =
    Object.selectionForField "(Maybe ScalarCodecs.Id)" "endCursor" [] (Evander.ScalarCodecs.codecs |> Evander.Scalar.unwrapCodecs |> .codecId |> .decoder |> Decode.nullable)
