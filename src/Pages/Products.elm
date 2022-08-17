module Pages.Products exposing (Model, Msg(..), page)

import App.Common.ContentPicker exposing (contentPicker)
import App.Layout exposing (layout)
import App.Products exposing (body)
import App.Shared.ProductGraphQl exposing (ProductConnection)
import Gen.Params.Products exposing (Params)
import Graphql.Http
import Page
import RemoteData exposing (RemoteData)
import Request
import Shared
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view shared
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


productsResponse : Shared.Model -> RemoteData (Graphql.Http.Error ProductConnection) ProductConnection
productsResponse model =
    model.queryStatus


view : Shared.Model -> Model -> View Msg
view shared model =
    { title = "Products"
    , body = contentPicker productsResponse shared (shared.list |> body) |> layout
    }
