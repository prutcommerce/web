module App.Home exposing (body)

import App.Home.Container exposing (container)
import App.Home.Heading exposing (heading)
import App.Home.Hero exposing (hero)
import App.Home.Products exposing (products)
import Html exposing (Html)


body : Html msg
body =
    container
        [ hero
            [ heading
            , products
            ]
        ]
