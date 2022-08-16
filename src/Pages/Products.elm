module Pages.Products exposing (Model, Msg, page)

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
                    [ text "Customers also purchased" ]
                , div
                    [ Attr.class "mt-6 grid grid-cols-1 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8"
                    ]
                    [ div
                        [ Attr.class "group relative"
                        ]
                        [ div
                            [ Attr.class "w-full min-h-80 bg-gray-200 aspect-w-1 aspect-h-1 rounded-md overflow-hidden group-hover:opacity-75 lg:h-80 lg:aspect-none"
                            ]
                            [ img
                                [ Attr.src "https://tailwindui.com/img/ecommerce-images/product-page-01-related-product-01.jpg"
                                , Attr.alt "Front of men's Basic Tee in black."
                                , Attr.class "w-full h-full object-center object-cover lg:w-full lg:h-full"
                                ]
                                []
                            ]
                        , div
                            [ Attr.class "mt-4 flex justify-between"
                            ]
                            [ div []
                                [ h3
                                    [ Attr.class "text-sm text-gray-700"
                                    ]
                                    [ a
                                        [ Attr.href "#"
                                        ]
                                        [ span
                                            [ Attr.attribute "aria-hidden" "true"
                                            , Attr.class "absolute inset-0"
                                            ]
                                            []
                                        , text "Basic Tee"
                                        ]
                                    ]
                                , p
                                    [ Attr.class "mt-1 text-sm text-gray-500"
                                    ]
                                    [ text "Black" ]
                                ]
                            , p
                                [ Attr.class "text-sm font-medium text-gray-900"
                                ]
                                [ text "$35" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    }
