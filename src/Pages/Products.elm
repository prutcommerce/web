module Pages.Products exposing (Model, Msg(..), page)

import App.Common.ContentPicker exposing (contentPicker)
import App.Layout exposing (layout)
import App.Products exposing (body)
import App.Products.Type exposing (Product)
import App.Shared.ProductGraphQL exposing (ProductConnection)
import Gen.Params.Products exposing (Params)
import Page
import Request
import Shared exposing (Feature)
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


products : Shared.Model -> Feature Product ProductConnection
products model =
    model.products


view : Shared.Model -> Model -> View Msg
view shared model =
    { title = "Products"
    , body = contentPicker products shared (shared.products.list |> body) |> layout
    }
