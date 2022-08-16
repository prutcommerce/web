module Gen.Msg exposing (Msg(..))

import Gen.Params.Home_
import Gen.Params.Products
import Gen.Params.NotFound
import Pages.Home_
import Pages.Products
import Pages.NotFound


type Msg
    = Products Pages.Products.Msg

