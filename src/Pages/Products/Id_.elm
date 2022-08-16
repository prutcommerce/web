module Pages.Products.Id_ exposing (view)

import App.Layout exposing (layout)
import Html exposing (..)
import Html.Attributes as Attr
import View exposing (View)


body : Html msg
body =
    div
        [ Attr.class "bg-white"
        ]
        [ div
            [ Attr.class "pt-6"
            ]
            [ div
                [ Attr.class "mt-6 max-w-2xl mx-auto sm:px-6 lg:max-w-7xl lg:px-8 lg:grid lg:grid-cols-3 lg:gap-x-8"
                ]
                [ div
                    [ Attr.class "hidden aspect-w-3 aspect-h-4 rounded-lg overflow-hidden lg:block"
                    ]
                    [ img
                        [ Attr.src "https://helios-i.mashable.com/imagery/roundups/02WgXOqM1CuP8hpI4P2pqmV/hero-image.fill.size_1200x675.v1646435289.jpg"
                        , Attr.class "w-full h-full object-center object-cover"
                        ]
                        []
                    ]
                , div
                    [ Attr.class "hidden lg:grid lg:grid-cols-1 lg:gap-y-8"
                    ]
                    [ div
                        [ Attr.class "aspect-w-3 aspect-h-2 rounded-lg overflow-hidden"
                        ]
                        [ img
                            [ Attr.src "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg"
                            , Attr.alt "Model wearing plain black basic tee."
                            , Attr.class "w-full h-full object-center object-cover"
                            ]
                            []
                        ]
                    , div
                        [ Attr.class "aspect-w-3 aspect-h-2 rounded-lg overflow-hidden"
                        ]
                        [ img
                            [ Attr.src "https://pyxis.nymag.com/v1/imgs/a2e/fbe/d0b26f8723437d87059c91f1fd965b5a32-bic-roller-skates-final.2x.rsocial.w600.jpg"
                            , Attr.alt "Model wearing plain gray basic tee."
                            , Attr.class "w-full h-full object-center object-cover"
                            ]
                            []
                        ]
                    ]
                , div
                    [ Attr.class "aspect-w-4 aspect-h-5 sm:rounded-lg sm:overflow-hidden lg:aspect-w-3 lg:aspect-h-4"
                    ]
                    [ img
                        [ Attr.src "https://cdn.webshopapp.com/shops/294109/files/319381193/image.jpg"
                        , Attr.alt "Model wearing plain white basic tee."
                        , Attr.class "w-full h-full object-center object-cover"
                        ]
                        []
                    ]
                ]
            , div
                [ Attr.class "max-w-2xl mx-auto pt-10 pb-16 px-4 sm:px-6 lg:max-w-7xl lg:pt-16 lg:pb-24 lg:px-8 lg:grid lg:grid-cols-3 lg:grid-rows-[auto,auto,1fr] lg:gap-x-8"
                ]
                [ div
                    [ Attr.class "lg:col-span-2 lg:border-r lg:border-gray-200 lg:pr-8"
                    ]
                    [ h1
                        [ Attr.class "text-2xl font-bold tracking-tight text-gray-900 sm:tracking-tight sm:text-3xl"
                        ]
                        [ text "Cool skates" ]
                    ]
                , div
                    []
                    [ form
                        []
                        [ button
                            [ Attr.type_ "submit"
                            , Attr.class "w-full bg-indigo-600 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                            ]
                            [ text "Add to bag" ]
                        ]
                    ]
                ]
            ]
        ]


view : View msg
view =
    { title = "Product"
    , body =
        [ body
        ]
            |> layout
    }
