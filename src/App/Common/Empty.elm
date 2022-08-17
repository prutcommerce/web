module App.Common.Empty exposing (empty)

import Color
import Html exposing (..)
import Html.Attributes as Attr
import Material.Icons as Filled
import Material.Icons.Types exposing (Coloring(..))


empty : Html msg
empty =
    div
        [ Attr.class "flex items-center justify-center flex-col h-full"
        ]
        [ div
            []
            [ Filled.inventory 100 (Color <| Color.rgb255 156 163 175) ]
        , div
            [ Attr.class "mt-3 text-3xl font-bold tracking-tight text-gray-400 sm:text-4xl" ]
            [ h3 [] [ text "Sorry, there's no content to display" ] ]
        ]
