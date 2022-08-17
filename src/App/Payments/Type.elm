module App.Payments.Type exposing (..)


type alias Payment =
    { id : String
    , orderId : String
    , status : String
    }
