module Pages.Home_ exposing (view)

import App.Common.Error exposing (error)
import App.Common.Loading exposing (loading)
import App.Home exposing (body)
import App.Layout exposing (layout)
import View exposing (View)


view : View msg
view =
    { title = "Homepage"
    , body = [ error ] |> layout
    }
