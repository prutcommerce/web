module Pages.Products exposing (Model, Msg, page)

import App.Products.Product exposing (product)
import Gen.Params.Products exposing (Params)
import Html exposing (..)
import Html.Attributes as Attr
import Page
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


view : Model -> View Msg
view model =
    { title = "Products"
    , body =
        [ div
            [ Attr.class "bg-white"
            ]
            [ div
                [ Attr.class "max-w-2xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8"
                ]
                [ h2
                    [ Attr.class "text-2xl font-bold tracking-tight text-gray-900"
                    ]
                    [ text "Here's a list of our products" ]
                , div
                    [ Attr.class "mt-6 grid grid-cols-1 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8"
                    ]
                    [ product
                    ]
                ]
            ]
        ]
    }
