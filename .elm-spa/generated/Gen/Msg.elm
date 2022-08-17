module Gen.Msg exposing (Msg(..))

import Gen.Params.Home_
import Gen.Params.Payments
import Gen.Params.Products
import Gen.Params.Products.Id_
import Gen.Params.NotFound
import Pages.Home_
import Pages.Payments
import Pages.Products
import Pages.Products.Id_
import Pages.NotFound


type Msg
    = Payments Pages.Payments.Msg
    | Products Pages.Products.Msg
    | Products__Id_ Pages.Products.Id_.Msg

