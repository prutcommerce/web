module App.Products.Product.Image exposing (image)

import App.Products.Type exposing (Product)
import Html exposing (..)
import Html.Attributes as Attr


image : Product -> Html msg
image { url } =
    div
        [ Attr.class "w-full min-h-80 bg-gray-200 aspect-w-1 aspect-h-1 rounded-md overflow-hidden group-hover:opacity-75 lg:h-80 lg:aspect-none"
        ]
        [ img
            [ Attr.src url
            , Attr.class "w-full h-full object-center object-cover lg:w-full lg:h-full"
            ]
            []
        ]
