module App.Products.Product exposing (product)

import App.Products.Product.Container exposing (container)
import App.Products.Product.Footer exposing (footer)
import App.Products.Product.Image exposing (image)
import App.Products.Product.Name exposing (name)
import App.Products.Type exposing (Product)
import Html exposing (Html)


product : Product -> Html msg
product input =
    container
        [ image input
        , footer
            [ name input
            ]
        ]
