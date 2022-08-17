module App.Common.ContentPicker exposing (contentPicker)

import App.Common.Empty exposing (empty)
import App.Common.Error exposing (error)
import App.Common.Loading exposing (loading)
import Html exposing (Html)
import RemoteData exposing (RemoteData(..))
import Shared exposing (Feature, Model)


contentPicker : (Model -> Feature a b) -> Model -> List (Html msg) -> List (Html msg)
contentPicker fieldPicker model children =
    let
        feature =
            fieldPicker model
    in
    case feature.status of
        NotAsked ->
            [ loading ]

        Loading ->
            [ loading ]

        Failure e ->
            [ error ]

        Success a ->
            if List.isEmpty feature.list then
                [ empty ]

            else
                children
