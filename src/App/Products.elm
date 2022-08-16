module App.Products exposing (body)

import App.Products.Product exposing (product)
import App.Products.Type exposing (Product)
import Html exposing (..)
import Html.Attributes as Attr


body : List Product -> List (Html msg)
body products =
    [ div
        [ Attr.class "bg-white"
        ]
        [ div
            [ Attr.class "max-w-2xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8"
            ]
            [ h2
                [ Attr.class "text-2xl font-bold tracking-tight text-gray-900"
                ]
                [ text "Here's a list of our products" ]
            , div
                [ Attr.class "mt-6 grid grid-cols-1 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8"
                ]
                (List.map product products)
            ]
        ]
    ]
