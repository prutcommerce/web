module Gen.Route exposing
    ( Route(..)
    , fromUrl
    , toHref
    )

import Gen.Params.Home_
import Gen.Params.Orders
import Gen.Params.Payments
import Gen.Params.Products
import Gen.Params.Orders.Id_
import Gen.Params.Products.Id_
import Gen.Params.NotFound
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = Home_
    | Orders
    | Payments
    | Products
    | Orders__Id_ { id : String }
    | Products__Id_ { id : String }
    | NotFound


fromUrl : Url -> Route
fromUrl =
    Parser.parse (Parser.oneOf routes) >> Maybe.withDefault NotFound


routes : List (Parser (Route -> a) a)
routes =
    [ Parser.map Home_ Gen.Params.Home_.parser
    , Parser.map Orders Gen.Params.Orders.parser
    , Parser.map Payments Gen.Params.Payments.parser
    , Parser.map Products Gen.Params.Products.parser
    , Parser.map NotFound Gen.Params.NotFound.parser
    , Parser.map Orders__Id_ Gen.Params.Orders.Id_.parser
    , Parser.map Products__Id_ Gen.Params.Products.Id_.parser
    ]


toHref : Route -> String
toHref route =
    let
        joinAsHref : List String -> String
        joinAsHref segments =
            "/" ++ String.join "/" segments
    in
    case route of
        Home_ ->
            joinAsHref []
    
        Orders ->
            joinAsHref [ "orders" ]
    
        Payments ->
            joinAsHref [ "payments" ]
    
        Products ->
            joinAsHref [ "products" ]
    
        Orders__Id_ params ->
            joinAsHref [ "orders", params.id ]
    
        Products__Id_ params ->
            joinAsHref [ "products", params.id ]
    
        NotFound ->
            joinAsHref [ "not-found" ]

