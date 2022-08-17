module App.Orders.Type exposing (Order)


type alias Order =
    { id : String
    , quantity : String
    , status : String
    , productId : String
    }
