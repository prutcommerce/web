module App.Layout exposing (layout)

import Html exposing (..)
import Html.Attributes as Attr


layout : List (Html msg) -> List (Html msg)
layout children =
    [ div
        [ Attr.class "h-full"
        ]
        [ nav
            [ Attr.class "bg-gray-800"
            ]
            [ div
                [ Attr.class "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"
                ]
                [ div
                    [ Attr.class "flex items-center justify-between h-16"
                    ]
                    [ div
                        [ Attr.class "flex items-center"
                        ]
                        [ div
                            [ Attr.class "flex-shrink-0"
                            ]
                            [ a [ Attr.href "/" ]
                                [ img
                                    [ Attr.class "h-8 w-8"
                                    , Attr.src "https://avatars.githubusercontent.com/u/106073586?s=200&v=4"
                                    , Attr.alt "Workflow"
                                    ]
                                    []
                                ]
                            ]
                        , div
                            [ Attr.class "md:block"
                            ]
                            [ div
                                [ Attr.class "ml-10 flex items-baseline space-x-4"
                                ]
                                [ a
                                    [ Attr.href "/products"
                                    , Attr.class "text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium"
                                    , Attr.attribute "aria-current" "page"
                                    ]
                                    [ text "Products" ]
                                , a
                                    [ Attr.href "/orders"
                                    , Attr.class "text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium"
                                    ]
                                    [ text "Orders" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , main_ []
            children
        ]
    ]
