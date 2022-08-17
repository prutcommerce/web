module Pages.Orders exposing (Model, Msg, page)

import App.Common.ContentPicker exposing (contentPicker)
import App.Layout exposing (layout)
import App.Orders exposing (body)
import App.Orders.Type exposing (Order)
import App.Shared.OrderGraphQL exposing (OrderConnection)
import Gen.Params.Orders exposing (Params)
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
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


orders : Shared.Model -> Feature Order OrderConnection
orders model =
    model.orders


view : Shared.Model -> Model -> View Msg
view shared model =
    { title = "Orders"
    , body = contentPicker orders shared (body shared) |> layout
    }
