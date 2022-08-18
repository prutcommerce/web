module App.Payments.Payment exposing (..)

import App.Payments.Type exposing (Payment)
import Html exposing (..)
import Html.Attributes as Attr


payment : Payment -> Html msg
payment input =
    div [ Attr.class "mt-5 rounded shadow-lg px-4 py-4 group" ]
        [ a
            [ Attr.href ("/orders/" ++ input.orderId)
            , Attr.class "text-2xl tracking-tight text-gray-900 group-hover:opacity-75"
            ]
            [ text ("Payment with order number: " ++ input.orderId) ]
        ]
