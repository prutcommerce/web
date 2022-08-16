module App.Home.Container exposing (..)

import Html exposing (Html, div)
import Html.Attributes as Attr


className : String
className =
    "bg-gray-50 home-container"


container : List (Html msg) -> Html msg
container content =
    div [ Attr.class className ] content
