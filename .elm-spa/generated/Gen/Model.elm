module Gen.Model exposing (Model(..))

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


type Model
    = Redirecting_
    | Home_ Gen.Params.Home_.Params
    | Payments Gen.Params.Payments.Params Pages.Payments.Model
    | Products Gen.Params.Products.Params Pages.Products.Model
    | Products__Id_ Gen.Params.Products.Id_.Params Pages.Products.Id_.Model
    | NotFound Gen.Params.NotFound.Params

