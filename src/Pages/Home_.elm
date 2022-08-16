module Pages.Home_ exposing (view)

import Html exposing (..)
import Html.Attributes as Attr
import View exposing (View)


body : Html msg
body =
    div
        [ Attr.class "bg-gray-50 home-container"
        ]
        [ div
            [ Attr.class "max-w-7xl h-full mx-auto py-12 px-4 sm:px-6 py-16 flex items-center justify-between"
            ]
            [ h2
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
            , div
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
            ]
        ]


view : View msg
view =
    { title = "Homepage"
    , body = [ body ]
    }
