module App.Home.Products exposing (..)

import Html exposing (..)
import Html.Attributes as Attr


products : Html msg
products =
    div
        [ Attr.class "mt-8 flex lg:mt-0 lg:flex-shrink-0"
        ]
        [ div
            [ Attr.class "inline-flex rounded-md shadow"
            ]
            [ a
                [ Attr.href "/products"
                , Attr.class "inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700"
                ]
                [ text "See our products" ]
            ]
        ]
