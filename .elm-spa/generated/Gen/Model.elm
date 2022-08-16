module Gen.Model exposing (Model(..))

import Gen.Params.Home_
import Gen.Params.Products
import Gen.Params.NotFound
import Pages.Home_
import Pages.Products
import Pages.NotFound


type Model
    = Redirecting_
    | Home_ Gen.Params.Home_.Params
    | Products Gen.Params.Products.Params Pages.Products.Model
    | NotFound Gen.Params.NotFound.Params

