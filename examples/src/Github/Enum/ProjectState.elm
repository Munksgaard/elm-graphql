-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 2.0.0
-- Target elm package version 5.0.0
-- https://github.com/dillonkearns/graphqelm


module Github.Enum.ProjectState exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| State of the project; either 'open' or 'closed'

  - Open - The project is open.
  - Closed - The project is closed.

-}
type ProjectState
    = Open
    | Closed


decoder : Decoder ProjectState
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "OPEN" ->
                        Decode.succeed Open

                    "CLOSED" ->
                        Decode.succeed Closed

                    _ ->
                        Decode.fail ("Invalid ProjectState type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : ProjectState -> String
toString enum =
    case enum of
        Open ->
            "OPEN"

        Closed ->
            "CLOSED"
