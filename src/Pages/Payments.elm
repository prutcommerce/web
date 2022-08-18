module Pages.Payments exposing (Model, Msg, page)

import App.Common.ContentPicker exposing (contentPicker)
import App.Layout exposing (layout)
import App.Payments.Payment exposing (payment)
import App.Payments.Type exposing (Payment)
import App.Shared.PaymentGraphQL exposing (PaymentConnection)
import Gen.Params.Payments exposing (Params)
import Html exposing (..)
import Html.Attributes as Attr
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


body : Shared.Model -> List (Html msg)
body shared =
    [ div
        [ Attr.class "bg-white"
        ]
        [ div
            [ Attr.class "max-w-2xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8"
            ]
            [ h2
                [ Attr.class "text-2xl font-bold tracking-tight text-gray-900"
                ]
                [ text "Here's a list of our payments" ]
            , div
                [ Attr.class "flex flex-col items-center justify-center mt-4"
                ]
                (List.map (\item -> payment item) <| shared.payments.list)
            ]
        ]
    ]


view : Shared.Model -> Model -> View Msg
view shared model =
    { title = "Payments"
    , body = contentPicker payments shared (body shared) |> layout
    }
