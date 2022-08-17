module App.Common.Loading exposing (loading)

import Html exposing (..)
import Html.Attributes as Attr


loading : Html msg
loading =
    div
        [ Attr.class "flex items-center justify-center flex-col h-full"
        ]
        [ div
            [ Attr.class "w-40 h-40 border-t-4 border-b-4 border-gray-800 rounded-full animate-spin"
            ]
            []
        , div
            [ Attr.class "mt-3 text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl" ]
            [ h3 [] [ text "Loading..." ] ]
        ]
