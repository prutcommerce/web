module Shared exposing
    ( Flags
    , Model
    , Msg
    , init
    , sendRequest
    , subscriptions
    , update
    )

import App.Products.Type exposing (Product)
import App.Shared.ProductGraphQl exposing (ProductConnection, ProductEdge, query)
import Array exposing (Array)
import Graphql.Http
import Json.Decode as Json
import RemoteData exposing (RemoteData(..))
import Request exposing (Request)


type alias Flags =
    Json.Value


type alias Response =
    { products : Maybe ProductConnection }


type alias RemoteResponse =
    RemoteData (Graphql.Http.Error ProductConnection) ProductConnection


type alias Model =
    { queryStatus : RemoteResponse
    , list : List Product
    }


sendRequest : Cmd Msg
sendRequest =
    query
        |> Graphql.Http.queryRequest "http://84.232.145.86:5000/graph"
        |> Graphql.Http.send (RemoteData.fromResult >> GotProducts)


type Msg
    = GotProducts RemoteResponse
    | SetProducts (List Product)


init : Request -> Flags -> ( Model, Cmd Msg )
init _ _ =
    ( { queryStatus = RemoteData.Loading, list = [] }, sendRequest )


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update request msg model =
    case msg of
        GotProducts response ->
            case response of
                Success products ->
                    update request (SetProducts (products.edges |> mapResults)) { model | queryStatus = response }

                _ ->
                    ( { model | queryStatus = response }, Cmd.none )

        SetProducts products ->
            ( { model | list = products }, Cmd.none )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


mapResults : List ProductEdge -> List Product
mapResults edges =
    edges
        |> List.map (\edge -> { id = edge.node.id, name = edge.node.name, url = getPseudoRandomImageUrl edge })


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
