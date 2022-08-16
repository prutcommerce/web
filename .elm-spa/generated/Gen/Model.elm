module Gen.Model exposing (Model(..))

import Gen.Params.Home_
import Gen.Params.Products
import Gen.Params.Products.Id_
import Gen.Params.NotFound
import Pages.Home_
import Pages.Products
import Pages.Products.Id_
import Pages.NotFound


type Model
    = Redirecting_
    | Home_ Gen.Params.Home_.Params
    | Products Gen.Params.Products.Params Pages.Products.Model
    | Products__Id_ Gen.Params.Products.Id_.Params
    | NotFound Gen.Params.NotFound.Params

