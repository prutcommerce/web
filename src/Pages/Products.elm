module Pages.Products exposing (Model, Msg, page)

import App.Layout exposing (layout)
import App.Products exposing (body)
import App.Products.Initial exposing (initial)
import App.Products.Type exposing (Product)
import Gen.Params.Products exposing (Params)
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
    { products : List Product
    }


init : ( Model, Cmd Msg )
init =
    ( { products = initial }, Cmd.none )



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
    , body = body model.products |> layout
    }
