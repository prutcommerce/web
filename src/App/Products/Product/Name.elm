module App.Products.Product.Name exposing (name)

import Html exposing (..)
import Html.Attributes as Attr


name : Html msg
name =
    div []
        [ h3
            [ Attr.class "text-sm text-gray-700"
            ]
            [ a
                [ Attr.href "#"
                ]
                [ span
                    [ Attr.attribute "aria-hidden" "true"
                    , Attr.class "absolute inset-0"
                    ]
                    []
                , text "Basic Tee"
                ]
            ]
        ]
