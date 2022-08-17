module App.Common.Error exposing (error)

import Color
import Html exposing (..)
import Html.Attributes as Attr
import Material.Icons as Filled
import Material.Icons.Types exposing (Coloring(..))


error : Html msg
error =
    div
        [ Attr.class "flex items-center justify-center flex-col h-full"
        ]
        [ div
            []
            [ Filled.production_quantity_limits 100 (Color <| Color.rgb255 156 163 175) ]
        , div
            [ Attr.class "mt-3 text-3xl font-bold tracking-tight text-gray-400 sm:text-4xl" ]
            [ h3 [] [ text "Oops, something went wrong" ] ]
        ]
