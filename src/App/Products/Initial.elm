module App.Products.Initial exposing (query, ProductConnection, ProductEdge)

import App.Products.Type
import Artemis.Query as Query exposing (ProductsOptionalArguments)
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, with)
import Artemis.Scalar exposing (..)
import Artemis.Object
import Artemis.Object.ProductEdge as Edge
import Artemis.Object.ProductConnection as Connection
import Artemis.Object.Product as Product

type alias ProductNode =
    { id : Id
    , name : String
    }

type alias ProductEdge =
    { node: ProductNode
    }

type alias ProductConnection =
    { edges: List (ProductEdge)
    }

images: List String
images =
    [ "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg"
    , "https://global-uploads.webflow.com/5ca5fe687e34be0992df1fbe/62841e551612bd1a927b44f3_boy-on-roller-skating-class-2021-08-26-16-53-45-utc-min.jpg"
    , "https://pyxis.nymag.com/v1/imgs/a2e/fbe/d0b26f8723437d87059c91f1fd965b5a32-bic-roller-skates-final.2x.rsocial.w600.jpg"
    ]

nodeSelection: SelectionSet ProductNode Artemis.Object.Product
nodeSelection =
    SelectionSet.succeed ProductNode
        |> with Product.id
        |> with Product.name

edgeSelection: SelectionSet ProductEdge Artemis.Object.ProductEdge
edgeSelection =
    SelectionSet.succeed ProductEdge
        |> with (Edge.node nodeSelection)

connectionSelection: SelectionSet ProductConnection Artemis.Object.ProductConnection
connectionSelection =
    SelectionSet.succeed ProductConnection
        |> with (Connection.edges edgeSelection)

arguments: ProductsOptionalArguments -> ProductsOptionalArguments
arguments _ = { first = Present 10, after = Absent }

query: SelectionSet ProductConnection RootQuery
query =
    Query.products arguments connectionSelection


initial : List App.Products.Type.Product
initial =
    [ { id = "id1", name = "skates1", url = "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg" }
    , { id = "id2", name = "skates2", url = "https://global-uploads.webflow.com/5ca5fe687e34be0992df1fbe/62841e551612bd1a927b44f3_boy-on-roller-skating-class-2021-08-26-16-53-45-utc-min.jpg" }
    , { id = "id3", name = "skates3", url = "https://pyxis.nymag.com/v1/imgs/a2e/fbe/d0b26f8723437d87059c91f1fd965b5a32-bic-roller-skates-final.2x.rsocial.w600.jpg" }
    , { id = "id4", name = "skates4", url = "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg" }
    , { id = "id5", name = "skates5", url = "https://global-uploads.webflow.com/5ca5fe687e34be0992df1fbe/62841e551612bd1a927b44f3_boy-on-roller-skating-class-2021-08-26-16-53-45-utc-min.jpg" }
    , { id = "id6", name = "skates6", url = "https://pyxis.nymag.com/v1/imgs/a2e/fbe/d0b26f8723437d87059c91f1fd965b5a32-bic-roller-skates-final.2x.rsocial.w600.jpg" }
    , { id = "id7", name = "skates7", url = "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg" }
    , { id = "id8", name = "skates8", url = "https://global-uploads.webflow.com/5ca5fe687e34be0992df1fbe/62841e551612bd1a927b44f3_boy-on-roller-skating-class-2021-08-26-16-53-45-utc-min.jpg" }
    , { id = "id9", name = "skates9", url = "https://pyxis.nymag.com/v1/imgs/a2e/fbe/d0b26f8723437d87059c91f1fd965b5a32-bic-roller-skates-final.2x.rsocial.w600.jpg" }
    , { id = "id10", name = "skates10", url = "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg" }
    , { id = "id11", name = "skates11", url = "https://global-uploads.webflow.com/5ca5fe687e34be0992df1fbe/62841e551612bd1a927b44f3_boy-on-roller-skating-class-2021-08-26-16-53-45-utc-min.jpg" }
    , { id = "id12", name = "skates12", url = "https://pyxis.nymag.com/v1/imgs/a2e/fbe/d0b26f8723437d87059c91f1fd965b5a32-bic-roller-skates-final.2x.rsocial.w600.jpg" }
    , { id = "id13", name = "skates13", url = "https://cdn.britannica.com/65/132165-050-EF2D11F2/roller-skater.jpg" }
    , { id = "id14", name = "skates14", url = "https://global-uploads.webflow.com/5ca5fe687e34be0992df1fbe/62841e551612bd1a927b44f3_boy-on-roller-skating-class-2021-08-26-16-53-45-utc-min.jpg" }
    ]
