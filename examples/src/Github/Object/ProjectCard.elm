-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 2.0.0
-- Target elm package version 5.0.0
-- https://github.com/dillonkearns/graphqelm


module Github.Object.ProjectCard exposing (..)

import Github.Enum.ProjectCardState
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.ProjectCard
selection constructor =
    Object.selection constructor


{-| The project column this card is associated under. A card may only belong to one
project column at a time. The column field will be null if the card is created
in a pending state and has yet to be associated with a column. Once cards are
associated with a column, they will not become pending in the future.
-}
column : SelectionSet selection Github.Object.ProjectColumn -> FieldDecoder (Maybe selection) Github.Object.ProjectCard
column object =
    Object.selectionFieldDecoder "column" [] object (identity >> Decode.maybe)


{-| The card content item
-}
content : SelectionSet selection Github.Union.ProjectCardItem -> FieldDecoder (Maybe selection) Github.Object.ProjectCard
content object =
    Object.selectionFieldDecoder "content" [] object (identity >> Decode.maybe)


{-| Identifies the date and time when the object was created.
-}
createdAt : FieldDecoder Github.Scalar.DateTime Github.Object.ProjectCard
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.map Github.Scalar.DateTime)


{-| The actor who created this card
-}
creator : SelectionSet selection Github.Interface.Actor -> FieldDecoder (Maybe selection) Github.Object.ProjectCard
creator object =
    Object.selectionFieldDecoder "creator" [] object (identity >> Decode.maybe)


id : FieldDecoder Github.Scalar.Id Github.Object.ProjectCard
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Github.Scalar.Id)


{-| The card note
-}
note : FieldDecoder (Maybe String) Github.Object.ProjectCard
note =
    Object.fieldDecoder "note" [] (Decode.string |> Decode.maybe)


{-| The project that contains this card.
-}
project : SelectionSet selection Github.Object.Project -> FieldDecoder selection Github.Object.ProjectCard
project object =
    Object.selectionFieldDecoder "project" [] object identity


{-| The HTTP path for this card
-}
resourcePath : FieldDecoder Github.Scalar.Uri Github.Object.ProjectCard
resourcePath =
    Object.fieldDecoder "resourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The state of ProjectCard
-}
state : FieldDecoder (Maybe Github.Enum.ProjectCardState.ProjectCardState) Github.Object.ProjectCard
state =
    Object.fieldDecoder "state" [] (Github.Enum.ProjectCardState.decoder |> Decode.maybe)


{-| The HTTP URL for this card
-}
url : FieldDecoder Github.Scalar.Uri Github.Object.ProjectCard
url =
    Object.fieldDecoder "url" [] (Decode.string |> Decode.map Github.Scalar.Uri)
