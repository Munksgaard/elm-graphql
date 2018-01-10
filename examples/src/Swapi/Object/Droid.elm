-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 2.0.0
-- Target elm package version 5.0.0
-- https://github.com/dillonkearns/graphqelm


module Swapi.Object.Droid exposing (..)

import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Swapi.Enum.Episode
import Swapi.Interface
import Swapi.Object
import Swapi.Scalar
import Swapi.Union


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Swapi.Object.Droid
selection constructor =
    Object.selection constructor


{-| Which movies they appear in.
-}
appearsIn : FieldDecoder (List Swapi.Enum.Episode.Episode) Swapi.Object.Droid
appearsIn =
    Object.fieldDecoder "appearsIn" [] (Swapi.Enum.Episode.decoder |> Decode.list)


{-| The friends of the droid, or an empty list if they have none.
-}
friends : SelectionSet selection Swapi.Interface.Character -> FieldDecoder (List selection) Swapi.Object.Droid
friends object =
    Object.selectionFieldDecoder "friends" [] object (identity >> Decode.list)


{-| The ID of the droid.
-}
id : FieldDecoder Swapi.Scalar.Id Swapi.Object.Droid
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Swapi.Scalar.Id)


{-| The name of the droid.
-}
name : FieldDecoder String Swapi.Object.Droid
name =
    Object.fieldDecoder "name" [] Decode.string


{-| The primary function of the droid.
-}
primaryFunction : FieldDecoder (Maybe String) Swapi.Object.Droid
primaryFunction =
    Object.fieldDecoder "primaryFunction" [] (Decode.string |> Decode.maybe)
