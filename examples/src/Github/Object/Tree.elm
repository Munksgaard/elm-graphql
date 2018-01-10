-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 2.0.0
-- Target elm package version 5.0.0
-- https://github.com/dillonkearns/graphqelm


module Github.Object.Tree exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Tree
selection constructor =
    Object.selection constructor


{-| An abbreviated version of the Git object ID
-}
abbreviatedOid : FieldDecoder String Github.Object.Tree
abbreviatedOid =
    Object.fieldDecoder "abbreviatedOid" [] Decode.string


{-| The HTTP path for this Git object
-}
commitResourcePath : FieldDecoder Github.Scalar.Uri Github.Object.Tree
commitResourcePath =
    Object.fieldDecoder "commitResourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL for this Git object
-}
commitUrl : FieldDecoder Github.Scalar.Uri Github.Object.Tree
commitUrl =
    Object.fieldDecoder "commitUrl" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| A list of tree entries.
-}
entries : SelectionSet selection Github.Object.TreeEntry -> FieldDecoder (Maybe (List selection)) Github.Object.Tree
entries object =
    Object.selectionFieldDecoder "entries" [] object (identity >> Decode.list >> Decode.maybe)


id : FieldDecoder Github.Scalar.Id Github.Object.Tree
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Github.Scalar.Id)


{-| The Git object ID
-}
oid : FieldDecoder Github.Scalar.GitObjectID Github.Object.Tree
oid =
    Object.fieldDecoder "oid" [] (Decode.string |> Decode.map Github.Scalar.GitObjectID)


{-| The Repository the Git object belongs to
-}
repository : SelectionSet selection Github.Object.Repository -> FieldDecoder selection Github.Object.Tree
repository object =
    Object.selectionFieldDecoder "repository" [] object identity
