module App.Products.Product exposing (product)

import App.Products.Product.Container exposing (container)
import App.Products.Product.Footer exposing (footer)
import App.Products.Product.Image exposing (image)
import App.Products.Product.Name exposing (name)
import Html exposing (Html)


product : Html msg
product =
    container
        [ image
        , footer
            [ name
            ]
        ]
