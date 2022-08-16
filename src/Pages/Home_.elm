module Pages.Home_ exposing (view)

import Html
import Html.Attributes exposing (class)
import View exposing (View)


view : View msg
view =
    { title = "Homepage"
    , body = [ Html.div [ class "flex", class "items-center", class "h-screen", class "w-screen", class "justify-center", class "home-container" ] [ Html.h1 [] [ Html.text "Mere!" ] ] ]
    }
