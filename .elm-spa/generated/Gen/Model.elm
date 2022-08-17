module Gen.Model exposing (Model(..))

import Gen.Params.Home_
import Gen.Params.Orders
import Gen.Params.Payments
import Gen.Params.Products
import Gen.Params.Orders.Id_
import Gen.Params.Products.Id_
import Gen.Params.NotFound
import Pages.Home_
import Pages.Orders
import Pages.Payments
import Pages.Products
import Pages.Orders.Id_
import Pages.Products.Id_
import Pages.NotFound


type Model
    = Redirecting_
    | Home_ Gen.Params.Home_.Params
    | Orders Gen.Params.Orders.Params Pages.Orders.Model
    | Payments Gen.Params.Payments.Params Pages.Payments.Model
    | Products Gen.Params.Products.Params Pages.Products.Model
    | Orders__Id_ Gen.Params.Orders.Id_.Params Pages.Orders.Id_.Model
    | Products__Id_ Gen.Params.Products.Id_.Params Pages.Products.Id_.Model
    | NotFound Gen.Params.NotFound.Params

