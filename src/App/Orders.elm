module App.Orders exposing (..)

import App.Orders.Order exposing (order)
import Html exposing (..)
import Html.Attributes as Attr
import Shared


body : Shared.Model -> List (Html msg)
body shared =
    [ div
        [ Attr.class "bg-white"
        ]
        [ div
            [ Attr.class "max-w-2xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8"
            ]
            [ h2
                [ Attr.class "text-2xl font-bold tracking-tight text-gray-900"
                ]
                [ text "Here's a list of our orders" ]
            , div
                [ Attr.class "flex flex-col items-center justify-center mt-4"
                ]
                (List.map (\item -> order shared.products.list item) <| shared.orders.list)
            ]
        ]
    ]
