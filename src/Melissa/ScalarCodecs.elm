-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Melissa.ScalarCodecs exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Melissa.Scalar exposing (defaultCodecs)


type alias Id =
    Melissa.Scalar.Id


codecs : Melissa.Scalar.Codecs Id
codecs =
    Melissa.Scalar.defineCodecs
        { codecId = defaultCodecs.codecId
        }
