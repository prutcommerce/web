module App.Products.Product.Name exposing (name)

import App.Products.Type exposing (Product)
import Html exposing (..)
import Html.Attributes as Attr


name : Product -> Html msg
name product =
    div []
        [ h3
            [ Attr.class "text-sm text-gray-700"
            ]
            [ a
                [ Attr.href (String.join "" [ "/products/", product.id ])
                ]
                [ span
                    [ Attr.attribute "aria-hidden" "true"
                    , Attr.class "absolute inset-0"
                    ]
                    []
                , text product.name
                ]
            ]
        ]
