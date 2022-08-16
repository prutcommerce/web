module App.Products.Product.Container exposing (container)

import Html exposing (..)
import Html.Attributes as Attr


container : List (Html msg) -> Html msg
container content =
    div
        [ Attr.class "group relative"
        ]
        content
