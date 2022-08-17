module App.Common.ContentPicker exposing (contentPicker)

import App.Common.Error exposing (error)
import App.Common.Loading exposing (loading)
import Graphql.Http
import Html exposing (Html)
import RemoteData exposing (RemoteData(..))
import Shared exposing (Model)


contentPicker : (Model -> RemoteData (Graphql.Http.Error a) a) -> Model -> List (Html msg) -> List (Html msg)
contentPicker fieldPicker model children =
    case fieldPicker model of
        NotAsked ->
            [ loading ]

        Loading ->
            [ loading ]

        Failure e ->
            [ error ]

        Success a ->
            children
