module Gen.Pages exposing (Model, Msg, init, subscriptions, update, view)

import Browser.Navigation exposing (Key)
import Effect exposing (Effect)
import ElmSpa.Page
import Gen.Params.Home_
import Gen.Params.Orders
import Gen.Params.Payments
import Gen.Params.Products
import Gen.Params.Orders.Id_
import Gen.Params.Products.Id_
import Gen.Params.NotFound
import Gen.Model as Model
import Gen.Msg as Msg
import Gen.Route as Route exposing (Route)
import Page exposing (Page)
import Pages.Home_
import Pages.Orders
import Pages.Payments
import Pages.Products
import Pages.Orders.Id_
import Pages.Products.Id_
import Pages.NotFound
import Request exposing (Request)
import Shared
import Task
import Url exposing (Url)
import View exposing (View)


type alias Model =
    Model.Model


type alias Msg =
    Msg.Msg


init : Route -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
init route =
    case route of
        Route.Home_ ->
            pages.home_.init ()
    
        Route.Orders ->
            pages.orders.init ()
    
        Route.Payments ->
            pages.payments.init ()
    
        Route.Products ->
            pages.products.init ()
    
        Route.Orders__Id_ params ->
            pages.orders__id_.init params
    
        Route.Products__Id_ params ->
            pages.products__id_.init params
    
        Route.NotFound ->
            pages.notFound.init ()


update : Msg -> Model -> Shared.Model -> Url -> Key -> ( Model, Effect Msg )
update msg_ model_ =
    case ( msg_, model_ ) of
        ( Msg.Orders msg, Model.Orders params model ) ->
            pages.orders.update params msg model
    
        ( Msg.Payments msg, Model.Payments params model ) ->
            pages.payments.update params msg model
    
        ( Msg.Products msg, Model.Products params model ) ->
            pages.products.update params msg model
    
        ( Msg.Orders__Id_ msg, Model.Orders__Id_ params model ) ->
            pages.orders__id_.update params msg model
    
        ( Msg.Products__Id_ msg, Model.Products__Id_ params model ) ->
            pages.products__id_.update params msg model

        _ ->
            \_ _ _ -> ( model_, Effect.none )


view : Model -> Shared.Model -> Url -> Key -> View Msg
view model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> View.none
    
        Model.Home_ params ->
            pages.home_.view params ()
    
        Model.Orders params model ->
            pages.orders.view params model
    
        Model.Payments params model ->
            pages.payments.view params model
    
        Model.Products params model ->
            pages.products.view params model
    
        Model.Orders__Id_ params model ->
            pages.orders__id_.view params model
    
        Model.Products__Id_ params model ->
            pages.products__id_.view params model
    
        Model.NotFound params ->
            pages.notFound.view params ()


subscriptions : Model -> Shared.Model -> Url -> Key -> Sub Msg
subscriptions model_ =
    case model_ of
        Model.Redirecting_ ->
            \_ _ _ -> Sub.none
    
        Model.Home_ params ->
            pages.home_.subscriptions params ()
    
        Model.Orders params model ->
            pages.orders.subscriptions params model
    
        Model.Payments params model ->
            pages.payments.subscriptions params model
    
        Model.Products params model ->
            pages.products.subscriptions params model
    
        Model.Orders__Id_ params model ->
            pages.orders__id_.subscriptions params model
    
        Model.Products__Id_ params model ->
            pages.products__id_.subscriptions params model
    
        Model.NotFound params ->
            pages.notFound.subscriptions params ()



-- INTERNALS


pages :
    { home_ : Static Gen.Params.Home_.Params
    , orders : Bundle Gen.Params.Orders.Params Pages.Orders.Model Pages.Orders.Msg
    , payments : Bundle Gen.Params.Payments.Params Pages.Payments.Model Pages.Payments.Msg
    , products : Bundle Gen.Params.Products.Params Pages.Products.Model Pages.Products.Msg
    , orders__id_ : Bundle Gen.Params.Orders.Id_.Params Pages.Orders.Id_.Model Pages.Orders.Id_.Msg
    , products__id_ : Bundle Gen.Params.Products.Id_.Params Pages.Products.Id_.Model Pages.Products.Id_.Msg
    , notFound : Static Gen.Params.NotFound.Params
    }
pages =
    { home_ = static Pages.Home_.view Model.Home_
    , orders = bundle Pages.Orders.page Model.Orders Msg.Orders
    , payments = bundle Pages.Payments.page Model.Payments Msg.Payments
    , products = bundle Pages.Products.page Model.Products Msg.Products
    , orders__id_ = bundle Pages.Orders.Id_.page Model.Orders__Id_ Msg.Orders__Id_
    , products__id_ = bundle Pages.Products.Id_.page Model.Products__Id_ Msg.Products__Id_
    , notFound = static Pages.NotFound.view Model.NotFound
    }


type alias Bundle params model msg =
    ElmSpa.Page.Bundle params model msg Shared.Model (Effect Msg) Model Msg (View Msg)


bundle page toModel toMsg =
    ElmSpa.Page.bundle
        { redirecting =
            { model = Model.Redirecting_
            , view = View.none
            }
        , toRoute = Route.fromUrl
        , toUrl = Route.toHref
        , fromCmd = Effect.fromCmd
        , mapEffect = Effect.map toMsg
        , mapView = View.map toMsg
        , toModel = toModel
        , toMsg = toMsg
        , page = page
        }


type alias Static params =
    Bundle params () Never


static : View Never -> (params -> Model) -> Static params
static view_ toModel =
    { init = \params _ _ _ -> ( toModel params, Effect.none )
    , update = \params _ _ _ _ _ -> ( toModel params, Effect.none )
    , view = \_ _ _ _ _ -> View.map never view_
    , subscriptions = \_ _ _ _ _ -> Sub.none
    }
    
