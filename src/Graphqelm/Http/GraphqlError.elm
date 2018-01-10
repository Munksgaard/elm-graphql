module Graphqelm.Http.GraphqlError exposing (GraphqlError, Location, decoder)

{-| See the [Errors section in the GraphQL spec](http://facebook.github.io/graphql/October2016/#sec-Errors).
@docs GraphqlError, decoder, Location
-}

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)


{-| Represents an error from the GraphQL endpoint. Also see `Graphqelm.Http`.

The code generated by Graphqelm
guarantees that your requests are valid according to the server's schema, so
the two cases where you will get a GraphqlError are 1) when there is an implicit
constraint that the schema doesn't specify, or 2) when your generated code is
out of date with the schema.

-}
type alias GraphqlError =
    { message : String
    , locations : Maybe (List Location)
    , details : Dict String Decode.Value
    }


{-| For internal use only.
-}
decoder : Decoder (List GraphqlError)
decoder =
    Decode.map3 GraphqlError
        (Decode.field "message" Decode.string)
        (Decode.maybe (Decode.field "locations" (Decode.list locationDecoder)))
        (Decode.dict Decode.value
            |> Decode.map (Dict.remove "message")
            |> Decode.map (Dict.remove "locations")
        )
        |> Decode.list
        |> Decode.field "errors"


{-| The location in the GraphQL query document where the error occured
-}
type alias Location =
    { line : Int, column : Int }


locationDecoder : Decode.Decoder Location
locationDecoder =
    Decode.map2 Location
        (Decode.field "line" Decode.int)
        (Decode.field "column" Decode.int)
