module App.Orders.Order exposing (order)

import App.Orders.Type exposing (Order)
import App.Products.Type exposing (Product)
import Html exposing (..)
import Html.Attributes as Attr


getProduct : List Product -> Order -> Product
getProduct products item =
    let
        query =
            List.filter (\product -> product.id == item.productId) products
                |> List.head
    in
    case query of
        Just product ->
            product

        Nothing ->
            { id = "invalid", name = "Invalid Product", url = "https://topmeaning.com/english/images/img/EN/i/invalid.jpg" }


order : List Product -> Order -> Html msg
order products item =
    let
        product =
            getProduct products item
    in
    div
        [ Attr.class "flex py-6 px-6 w-5/6 rounded shadow-lg order-container group"
        ]
        [ div
            [ Attr.class "h-80 w-80 flex-shrink-0 overflow-hidden rounded-md border border-gray-200 group-hover:opacity-75"
            ]
            [ img
                [ Attr.src product.url
                , Attr.class "h-full w-full object-cover object-center"
                ]
                []
            ]
        , div
            [ Attr.class "ml-4 flex flex-1 flex-col"
            ]
            [ div []
                [ div
                    [ Attr.class "flex justify-end text-base font-medium text-gray-900"
                    ]
                    [ h3 []
                        [ a
                            [ Attr.href (String.concat [ "/products", product.id ])
                            ]
                            [ text product.name ]
                        ]
                    ]
                ]
            , div
                [ Attr.class "flex flex-1 items-end justify-end text-sm"
                ]
                [ p
                    [ Attr.class "text-gray-500"
                    ]
                    [ text (String.concat [ "Quantity ", item.quantity ]) ]
                ]
            ]
        ]
