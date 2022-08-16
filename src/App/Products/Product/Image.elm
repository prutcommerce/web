module App.Products.Product.Image exposing (image)

import Html exposing (..)
import Html.Attributes as Attr


image : Html msg
image =
    div
        [ Attr.class "w-full min-h-80 bg-gray-200 aspect-w-1 aspect-h-1 rounded-md overflow-hidden group-hover:opacity-75 lg:h-80 lg:aspect-none"
        ]
        [ img
            [ Attr.src "https://tailwindui.com/img/ecommerce-images/product-page-01-related-product-01.jpg"
            , Attr.alt "Front of men's Basic Tee in black."
            , Attr.class "w-full h-full object-center object-cover lg:w-full lg:h-full"
            ]
            []
        ]
