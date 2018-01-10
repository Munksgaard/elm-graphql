-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 2.0.0
-- Target elm package version 5.0.0
-- https://github.com/dillonkearns/graphqelm


module Github.Object.RepositoryTopic exposing (..)

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


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.RepositoryTopic
selection constructor =
    Object.selection constructor


id : FieldDecoder Github.Scalar.Id Github.Object.RepositoryTopic
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Github.Scalar.Id)


{-| The HTTP path for this repository-topic.
-}
resourcePath : FieldDecoder Github.Scalar.Uri Github.Object.RepositoryTopic
resourcePath =
    Object.fieldDecoder "resourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The topic.
-}
topic : SelectionSet selection Github.Object.Topic -> FieldDecoder selection Github.Object.RepositoryTopic
topic object =
    Object.selectionFieldDecoder "topic" [] object identity


{-| The HTTP URL for this repository-topic.
-}
url : FieldDecoder Github.Scalar.Uri Github.Object.RepositoryTopic
url =
    Object.fieldDecoder "url" [] (Decode.string |> Decode.map Github.Scalar.Uri)
