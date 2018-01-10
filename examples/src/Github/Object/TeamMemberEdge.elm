-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 2.0.0
-- Target elm package version 5.0.0
-- https://github.com/dillonkearns/graphqelm


module Github.Object.TeamMemberEdge exposing (..)

import Github.Enum.TeamMemberRole
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.TeamMemberEdge
selection constructor =
    Object.selection constructor


cursor : FieldDecoder String Github.Object.TeamMemberEdge
cursor =
    Object.fieldDecoder "cursor" [] Decode.string


{-| The HTTP path to the organization's member access page.
-}
memberAccessResourcePath : FieldDecoder Github.Scalar.Uri Github.Object.TeamMemberEdge
memberAccessResourcePath =
    Object.fieldDecoder "memberAccessResourcePath" [] (Decode.string |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL to the organization's member access page.
-}
memberAccessUrl : FieldDecoder Github.Scalar.Uri Github.Object.TeamMemberEdge
memberAccessUrl =
    Object.fieldDecoder "memberAccessUrl" [] (Decode.string |> Decode.map Github.Scalar.Uri)


node : SelectionSet selection Github.Object.User -> FieldDecoder selection Github.Object.TeamMemberEdge
node object =
    Object.selectionFieldDecoder "node" [] object identity


{-| The role the member has on the team.
-}
role : FieldDecoder Github.Enum.TeamMemberRole.TeamMemberRole Github.Object.TeamMemberEdge
role =
    Object.fieldDecoder "role" [] Github.Enum.TeamMemberRole.decoder
