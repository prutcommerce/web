module Pages.Products exposing (Model, Msg(..), page)

import App.Layout exposing (layout)
import App.Products exposing (body)
import App.Products.Initial exposing (ProductConnection, ProductEdge, query)
import App.Products.Type exposing (Product)
import Gen.Params.Products exposing (Params)
import Graphql.Http
import Html exposing (Html, text)
import List.Extra exposing (getAt)
import Page
import RemoteData exposing (RemoteData(..))
import Request
import Shared
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


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
        |> Graphql.Http.queryRequest "http://173.249.46.33:5000/graph"
        |> Graphql.Http.send (RemoteData.fromResult >> GotProducts)


init : ( Model, Cmd Msg )
init =
    ( { queryStatus = RemoteData.Loading, list = [] }, sendRequest )



-- UPDATE


type Msg
    = GotProducts RemoteResponse
    | SetProducts (List Product)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotProducts response ->
            case response of
                Success products ->
                    update (SetProducts (products.edges |> mapResults)) { model | queryStatus = response }

                _ ->
                    ( { model | queryStatus = response }, Cmd.none )

        SetProducts products ->
            ( { model | list = products }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


mapResults : List ProductEdge -> List Product
mapResults edges =
    edges
        |> List.map (\edge -> { id = edge.node.id, name = edge.node.name, url = getRandomImageUrl edge })


getRandomImageUrl : ProductEdge -> String
getRandomImageUrl _ =
    let
        index =
            1
    in
    case getAt index images of
        Just url ->
            url

        Nothing ->
            ""


images : List String
images =
    [ "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg"
    , "https://global-uploads.webflow.com/5ca5fe687e34be0992df1fbe/62841e551612bd1a927b44f3_boy-on-roller-skating-class-2021-08-26-16-53-45-utc-min.jpg"
    , "https://pyxis.nymag.com/v1/imgs/a2e/fbe/d0b26f8723437d87059c91f1fd965b5a32-bic-roller-skates-final.2x.rsocial.w600.jpg"
    ]


view : Model -> View Msg
view model =
    { title = "Products"
    , body = model.list |> body |> layout
    }
