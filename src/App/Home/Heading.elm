module App.Home.Heading exposing (heading)

import Html exposing (..)
import Html.Attributes as Attr


heading : Html msg
heading =
    h2
        [ Attr.class "text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl"
        ]
        [ span
            [ Attr.class "block"
            ]
            [ text "Tired of regular shopping?" ]
        , span
            [ Attr.class "block text-indigo-600"
            ]
            [ text "Try Prut Commerce" ]
        ]
