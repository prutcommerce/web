module Pages.Payments exposing (Model, Msg, page)

import App.Common.ContentPicker exposing (contentPicker)
import App.Layout exposing (layout)
import App.Payments.Type exposing (Payment)
import App.Shared.PaymentGraphQL exposing (PaymentConnection)
import Gen.Params.Payments exposing (Params)
import Html exposing (div)
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


payments : Shared.Model -> Feature Payment PaymentConnection
payments model =
    model.payments


view : Shared.Model -> Model -> View Msg
view shared model =
    { title = "Payments"
    , body = contentPicker payments shared [ div [] [] ] |> layout
    }
