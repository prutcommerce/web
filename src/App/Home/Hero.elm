module App.Home.Hero exposing (..)

import Html exposing (Html, div)
import Html.Attributes as Attr


className : String
className =
    "max-w-7xl h-full mx-auto px-4 sm:px-6 flex items-center justify-between"


hero : List (Html msg) -> Html msg
hero content =
    div [ Attr.class className ] content
