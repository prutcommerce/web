module App.Products.Product.Footer exposing (footer)

import Html exposing (..)
import Html.Attributes as Attr


footer : List (Html msg) -> Html msg
footer content =
    div
        [ Attr.class "mt-4 flex justify-between"
        ]
        content
