-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 2.0.0
-- Target elm package version 5.0.0
-- https://github.com/dillonkearns/graphqelm


module Github.InputObject.AcceptTopicSuggestionInput exposing (..)

import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.Union
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Encode a AcceptTopicSuggestionInput into a value that can be used as an argument.
-}
encode : AcceptTopicSuggestionInput -> Value
encode input =
    Encode.maybeObject
        [ ( "clientMutationId", Encode.string |> Encode.optional input.clientMutationId ), ( "repositoryId", (\(Github.Scalar.Id raw) -> Encode.string raw) input.repositoryId |> Just ), ( "name", Encode.string input.name |> Just ) ]


{-| Type for the AcceptTopicSuggestionInput input object.
-}
type alias AcceptTopicSuggestionInput =
    { clientMutationId : OptionalArgument String, repositoryId : Github.Scalar.Id, name : String }
