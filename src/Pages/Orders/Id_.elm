module Pages.Orders.Id_ exposing (Model, Msg, page)

import App.Layout exposing (layout)
import App.Orders.Type exposing (Order)
import App.Products.Type exposing (Product)
import Debug exposing (toString)
import Gen.Params.Orders.Id_ exposing (Params)
import Html exposing (..)
import Html.Attributes as Attr
import Page
import Request
import Shared
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init req
        , update = update
        , view = view shared
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    { id : String }


init : Request.With Params -> ( Model, Cmd Msg )
init request =
    ( { id = request.params.id }, Cmd.none )



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


getCurrentOrder : Shared.Model -> Model -> Order
getCurrentOrder shared model =
    let
        query =
            List.filter (\element -> element.id == model.id) shared.orders.list
                |> List.head
    in
    case query of
        Just product ->
            product

        Nothing ->
            { id = "", quantity = "", productId = "", status = "" }


getCurrentProduct : Shared.Model -> String -> Product
getCurrentProduct shared productId =
    let
        query =
            List.filter (\element -> element.id == productId) shared.products.list
                |> List.head
    in
    case query of
        Just product ->
            product

        Nothing ->
            { id = "", name = "", url = "" }


body : Shared.Model -> Model -> List (Html msg)
body shared model =
    let
        currentOrder =
            getCurrentOrder shared model

        currentProduct =
            getCurrentProduct shared currentOrder.productId
    in
    [ div
        [ Attr.class "bg-white"
        ]
        [ div
            [ Attr.class "max-w-2xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8"
            ]
            [ h2
                [ Attr.class "text-2xl font-bold tracking-tight text-gray-900"
                ]
                [ text ("Here are the details for order " ++ model.id) ]
            , div
                [ Attr.class "flex flex-col items-center justify-center mt-10"
                ]
                [ div
                    [ Attr.class "flex items-center justify-center h-full flex-col"
                    ]
                    [ div
                        [ Attr.class "md:grid md:grid-cols-3 md:gap-6"
                        ]
                        [ div
                            [ Attr.class "md:col-span-1"
                            ]
                            [ div
                                [ Attr.class "px-4 sm:px-0"
                                ]
                                [ h3
                                    [ Attr.class "text-lg font-medium leading-6 text-gray-900"
                                    ]
                                    [ text "Order details" ]
                                , p
                                    [ Attr.class "mt-1 text-sm text-gray-600"
                                    ]
                                    [ text "Please review the order's details carefully for any faults." ]
                                ]
                            ]
                        , div
                            [ Attr.class "mt-5 md:mt-0 md:col-span-2"
                            ]
                            [ div
                                [ Attr.class "shadow overflow-hidden sm:rounded-md"
                                ]
                                [ div
                                    [ Attr.class "border-t border-gray-200"
                                    ]
                                    [ dl []
                                        [ div
                                            [ Attr.class "bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6"
                                            ]
                                            [ dt
                                                [ Attr.class "text-sm font-medium text-gray-500"
                                                ]
                                                [ text "Product name" ]
                                            , dd
                                                [ Attr.class "mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2"
                                                ]
                                                [ text currentProduct.name ]
                                            ]
                                        , div
                                            [ Attr.class "bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6"
                                            ]
                                            [ dt
                                                [ Attr.class "text-sm font-medium text-gray-500"
                                                ]
                                                [ text "Quantity" ]
                                            , dd
                                                [ Attr.class "mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2"
                                                ]
                                                [ text currentOrder.quantity ]
                                            ]
                                        , div
                                            [ Attr.class "bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6"
                                            ]
                                            [ dt
                                                [ Attr.class "text-sm font-medium text-gray-500"
                                                ]
                                                [ text "Product preview" ]
                                            , dd
                                                [ Attr.class "mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2"
                                                ]
                                                [ img [ Attr.src currentProduct.url ] [] ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    , div
                        [ Attr.class "md:grid md:grid-cols-3 md:gap-6 mt-10"
                        ]
                        [ div
                            [ Attr.class "md:col-span-1"
                            ]
                            [ div
                                [ Attr.class "px-4 sm:px-0"
                                ]
                                [ h3
                                    [ Attr.class "text-lg font-medium leading-6 text-gray-900"
                                    ]
                                    [ text "Payment details" ]
                                , p
                                    [ Attr.class "mt-1 text-sm text-gray-600"
                                    ]
                                    [ text "Please input your payment details to finish the order." ]
                                ]
                            ]
                        , div
                            [ Attr.class "mt-5 md:mt-0 md:col-span-2"
                            ]
                            [ form
                                []
                                [ div
                                    [ Attr.class "shadow overflow-hidden sm:rounded-md"
                                    ]
                                    [ div
                                        [ Attr.class "px-4 py-5 bg-white sm:p-6"
                                        ]
                                        [ div
                                            [ Attr.class "grid grid-cols-6 gap-6"
                                            ]
                                            [ div
                                                [ Attr.class "col-span-6 sm:col-span-4"
                                                ]
                                                [ label
                                                    [ Attr.for "card-number"
                                                    , Attr.class "block text-sm font-medium text-gray-700"
                                                    ]
                                                    [ text "Card Number" ]
                                                , input
                                                    [ Attr.type_ "text"
                                                    , Attr.name "card-number"
                                                    , Attr.id "card-number"
                                                    , Attr.class "mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                                    ]
                                                    []
                                                ]
                                            , div
                                                [ Attr.class "col-span-6 sm:col-span-2"
                                                ]
                                                [ label
                                                    [ Attr.for "card-cvv"
                                                    , Attr.class "block text-sm font-medium text-gray-700"
                                                    ]
                                                    [ text "Card CVV" ]
                                                , input
                                                    [ Attr.type_ "text"
                                                    , Attr.name "card-cvv"
                                                    , Attr.id "card-cvv"
                                                    , Attr.class "mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                                    ]
                                                    []
                                                ]
                                            , div
                                                [ Attr.class "col-span-6 sm:col-span-2"
                                                ]
                                                [ label
                                                    [ Attr.for "card-expiry-year"
                                                    , Attr.class "block text-sm font-medium text-gray-700"
                                                    ]
                                                    [ text "Card Expiry Year" ]
                                                , input
                                                    [ Attr.type_ "number"
                                                    , Attr.name "card-expiry-year"
                                                    , Attr.id "card-expiry-year"
                                                    , Attr.class "mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                                    ]
                                                    []
                                                ]
                                            , div
                                                [ Attr.class "col-span-6 sm:col-span-2"
                                                ]
                                                [ label
                                                    [ Attr.for "card-expiry-month"
                                                    , Attr.class "block text-sm font-medium text-gray-700"
                                                    ]
                                                    [ text "Card Expiry Month" ]
                                                , input
                                                    [ Attr.type_ "number"
                                                    , Attr.name "card-expiry-month"
                                                    , Attr.id "card-expiry-month"
                                                    , Attr.class "mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                                    ]
                                                    []
                                                ]
                                            ]
                                        ]
                                    , div
                                        [ Attr.class "px-4 py-3 bg-gray-50 text-right sm:px-6"
                                        ]
                                        [ button
                                            [ Attr.type_ "submit"
                                            , Attr.class "inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                                            ]
                                            [ text "Pay" ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]


view : Shared.Model -> Model -> View Msg
view shared model =
    { title = "Order"
    , body = body shared model |> layout
    }
