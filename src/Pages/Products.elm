module Pages.Products exposing (Model, Msg(..), page)

import App.Layout exposing (layout)
import App.Products exposing (body)
import App.Products.Initial exposing (ProductConnection, ProductEdge, query)
import App.Products.Initial exposing (ProductConnection, ProductEdge, query)
import App.Products.Type exposing (Product)
import Gen.Params.Products exposing (Params)
import Graphql.Http
import Html exposing (Html, text)
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
    { products: Maybe ProductConnection }


type alias Model =
   RemoteData (Graphql.Http.Error ProductConnection) ProductConnection

pula: Cmd Msg
pula =
       query
        |> Graphql.Http.queryRequest "http://173.249.46.33:5000/graph"
        |> Graphql.Http.send (RemoteData.fromResult >> GotProducts)

init : ( Model, Cmd Msg )
init =
    ( RemoteData.Loading, pula )



-- UPDATE


type Msg
    = ReplaceMe
    | GotProducts Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            ( model, Cmd.none )

        GotProducts products ->
            (products, Cmd.none)






-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW

someShit: Model -> List(Html Msg)
someShit model =
    case model of
        NotAsked ->
            [text "Not executed"]


        Loading ->
            [text "Loading"]


        Failure error ->
            [text "Am crapat sa moara mama"]


        Success response ->
            response.edges |> mapPeMata |> body |> layout

mapPeMata: List(ProductEdge) -> List(Product)
mapPeMata edges =
       edges
        |> List.map(\edge -> {id = "", name = edge.node.name, url = ""})



view : Model -> View Msg
view model =
    { title = "Products"
    , body = someShit model
    }
