module Shared exposing
    ( Flags
    , Model
    , Msg
    , getProducts
    , init
    , subscriptions
    , update
    )

import App.Orders.Type exposing (Order)
import App.Payments.Type exposing (Payment)
import App.Products.Type exposing (Product)
import App.Shared.OrderGraphQL as OrderGraphQL exposing (OrderConnection, OrderEdge)
import App.Shared.PaymentGraphQL as PaymentGraphQL exposing (PaymentConnection, PaymentEdge)
import App.Shared.ProductGraphQL exposing (ProductConnection, ProductEdge, query)
import Array exposing (Array)
import Graphql.Http
import Json.Decode as Json
import RemoteData exposing (RemoteData(..))
import Request exposing (Request)


type alias Flags =
    Json.Value


type alias ProductResponse =
    RemoteData (Graphql.Http.Error ProductConnection) ProductConnection


type alias OrderResponse =
    RemoteData (Graphql.Http.Error OrderConnection) OrderConnection


type alias PaymentResponse =
    RemoteData (Graphql.Http.Error PaymentConnection) PaymentConnection


type alias Feature entity response =
    { status : response
    , list : List entity
    }


type alias Model =
    { products : Feature Product ProductResponse
    , orders : Feature Order OrderResponse
    , payments : Feature Payment PaymentResponse
    }


getProducts : Cmd Msg
getProducts =
    query
        |> Graphql.Http.queryRequest "http://84.232.145.86:5000/graph"
        |> Graphql.Http.send (RemoteData.fromResult >> GotProducts)


getOrders : Cmd Msg
getOrders =
    OrderGraphQL.query
        |> Graphql.Http.queryRequest "http://84.232.145.86:5050/graph"
        |> Graphql.Http.send (RemoteData.fromResult >> GotOrders)


getPayments : Cmd Msg
getPayments =
    PaymentGraphQL.query
        |> Graphql.Http.queryRequest "http://84.232.145.86:5100/graph"
        |> Graphql.Http.send (RemoteData.fromResult >> GotPayments)


type Msg
    = GotProducts ProductResponse
    | GotOrders OrderResponse
    | GotPayments PaymentResponse


init : Request -> Flags -> ( Model, Cmd Msg )
init _ _ =
    let
        initial =
            { status = RemoteData.Loading, list = [] }
    in
    ( { products = initial, orders = initial, payments = initial }, Cmd.batch [ getProducts, getOrders, getPayments ] )


changeProducts : Model -> ProductResponse -> List ProductEdge -> Model
changeProducts model response products =
    { status = response, list = mapProducts products }
        |> (\newProducts -> { model | products = newProducts })


changeOrders : Model -> OrderResponse -> List OrderEdge -> Model
changeOrders model response orders =
    { status = response, list = mapOrders orders }
        |> (\newOrders -> { model | orders = newOrders })


changePayments : Model -> PaymentResponse -> List PaymentEdge -> Model
changePayments model response payments =
    { status = response, list = mapPayments payments }
        |> (\newPayments -> { model | payments = newPayments })


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        GotProducts response ->
            case response of
                Success products ->
                    ( changeProducts model response products.edges, Cmd.none )

                _ ->
                    ( { model | products = { list = model.products.list, status = response } }, Cmd.none )

        GotOrders response ->
            case response of
                Success orders ->
                    ( changeOrders model response orders.edges, Cmd.none )

                _ ->
                    ( { model | orders = { list = model.orders.list, status = response } }, Cmd.none )

        GotPayments response ->
            case response of
                Success payments ->
                    ( changePayments model response payments.edges, Cmd.none )

                _ ->
                    ( { model | payments = { list = model.payments.list, status = response } }, Cmd.none )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


mapProducts : List ProductEdge -> List Product
mapProducts edges =
    edges
        |> List.map (\edge -> { id = edge.node.id, name = edge.node.name, url = getPseudoRandomImageUrl edge })


mapOrders : List OrderEdge -> List Order
mapOrders edges =
    edges
        |> List.map (\edge -> { id = edge.node.id, quantity = edge.node.quantity, status = edge.node.status, productId = edge.node.productId })


mapPayments : List PaymentEdge -> List Payment
mapPayments edges =
    edges
        |> List.map (\edge -> { id = edge.node.id, status = edge.node.status, orderId = edge.node.orderId })


getPseudoRandomImageUrl : ProductEdge -> String
getPseudoRandomImageUrl product =
    String.toList product.node.id
        |> List.map Char.toCode
        |> List.sum
        |> modBy (Array.length images)
        |> (\index ->
                Array.get index images
                    |> coalesceMaybeString
           )


coalesceMaybeString : Maybe String -> String
coalesceMaybeString maybe =
    case maybe of
        Just string ->
            string

        Nothing ->
            "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg"


images : Array String
images =
    [ "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg"
    , "https://global-uploads.webflow.com/5ca5fe687e34be0992df1fbe/62841e551612bd1a927b44f3_boy-on-roller-skating-class-2021-08-26-16-53-45-utc-min.jpg"
    , "https://pyxis.nymag.com/v1/imgs/a2e/fbe/d0b26f8723437d87059c91f1fd965b5a32-bic-roller-skates-final.2x.rsocial.w600.jpg"
    ]
        |> Array.fromList
