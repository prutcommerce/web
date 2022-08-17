module Pages.Products.Id_ exposing (Model, Msg(..), page)

import App.Layout exposing (layout)
import App.Products.Type exposing (Product)
import Gen.Params.Products.Id_ exposing (Params)
import Html exposing (..)
import Html.Attributes as Attr
import Page
import Request
import Shared
import View exposing (View)


type alias Model =
    { id : String }


type Msg
    = NoOp


init : Request.With Params -> ( Model, Cmd Msg )
init request =
    ( { id = request.params.id }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init req
        , update = update
        , view = view shared
        , subscriptions = subscriptions
        }


getCurrent : Shared.Model -> Model -> Product
getCurrent shared model =
    let
        query =
            List.filter (\element -> element.id == model.id) shared.products.list
                |> List.head
    in
    case query of
        Just product ->
            product

        Nothing ->
            { id = "", name = "", url = "" }


body : Shared.Model -> Model -> Html msg
body shared model =
    let
        current =
            getCurrent shared model
    in
    div
        [ Attr.class "bg-white"
        ]
        [ div
            [ Attr.class "pt-6"
            ]
            [ div
                [ Attr.class "mt-6 max-w-2xl mx-auto sm:px-6 lg:max-w-7xl lg:px-8 lg:grid lg:grid-cols-3 lg:gap-x-8"
                ]
                [ div
                    [ Attr.class "hidden aspect-w-3 aspect-h-4 rounded-lg overflow-hidden lg:block"
                    ]
                    [ img
                        [ Attr.src current.url
                        , Attr.class "w-full h-full object-center object-cover"
                        ]
                        []
                    ]
                , div
                    [ Attr.class "hidden lg:grid lg:grid-cols-1 lg:gap-y-8"
                    ]
                    [ div
                        [ Attr.class "aspect-w-3 aspect-h-2 rounded-lg overflow-hidden"
                        ]
                        [ img
                            [ Attr.src current.url
                            , Attr.class "w-full h-full object-center object-cover"
                            ]
                            []
                        ]
                    , div
                        [ Attr.class "aspect-w-3 aspect-h-2 rounded-lg overflow-hidden"
                        ]
                        [ img
                            [ Attr.src current.url
                            , Attr.class "w-full h-full object-center object-cover"
                            ]
                            []
                        ]
                    ]
                , div
                    [ Attr.class "aspect-w-4 aspect-h-5 sm:rounded-lg sm:overflow-hidden lg:aspect-w-3 lg:aspect-h-4"
                    ]
                    [ img
                        [ Attr.src current.url
                        , Attr.class "w-full h-full object-center object-cover"
                        ]
                        []
                    ]
                ]
            , div
                [ Attr.class "max-w-2xl mx-auto pt-10 pb-16 px-4 sm:px-6 lg:max-w-7xl lg:pt-16 lg:pb-24 lg:px-8 lg:grid lg:grid-cols-3 lg:grid-rows-[auto,auto,1fr] lg:gap-x-8"
                ]
                [ div
                    [ Attr.class "lg:col-span-2 lg:border-r lg:border-gray-200 lg:pr-8"
                    ]
                    [ h1
                        [ Attr.class "text-2xl font-bold tracking-tight text-gray-900 sm:tracking-tight sm:text-3xl"
                        ]
                        [ text current.name ]
                    ]
                , div
                    []
                    [ form
                        []
                        [ button
                            [ Attr.type_ "submit"
                            , Attr.class "w-full bg-indigo-600 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                            ]
                            [ text "Add to bag" ]
                        ]
                    ]
                ]
            ]
        ]


view : Shared.Model -> Model -> View msg
view shared model =
    { title = "Product"
    , body =
        [ body shared model
        ]
            |> layout
    }
