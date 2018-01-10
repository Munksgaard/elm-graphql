-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 2.0.0
-- Target elm package version 5.0.0
-- https://github.com/dillonkearns/graphqelm


module Github.Union.Closer exposing (..)

import Github.Interface
import Github.Object
import Github.Union
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (FragmentSelectionSet(FragmentSelectionSet), SelectionSet(SelectionSet))
import Json.Decode as Decode


selection : (Maybe typeSpecific -> constructor) -> List (FragmentSelectionSet typeSpecific Github.Union.Closer) -> SelectionSet constructor Github.Union.Closer
selection constructor typeSpecificDecoders =
    Object.unionSelection typeSpecificDecoders constructor


onCommit : SelectionSet selection Github.Object.Commit -> FragmentSelectionSet selection Github.Union.Closer
onCommit (SelectionSet fields decoder) =
    FragmentSelectionSet "Commit" fields decoder


onPullRequest : SelectionSet selection Github.Object.PullRequest -> FragmentSelectionSet selection Github.Union.Closer
onPullRequest (SelectionSet fields decoder) =
    FragmentSelectionSet "PullRequest" fields decoder
