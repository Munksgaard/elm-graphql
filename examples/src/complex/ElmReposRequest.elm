module ElmReposRequest exposing (Repo, SortOrder(..), query)

import Github.Enum.IssueState
import Github.Enum.SearchType
import Github.Interface
import Github.Interface.RepositoryOwner
import Github.Object
import Github.Object.IssueConnection
import Github.Object.Repository as Repository
import Github.Object.SearchResultItemConnection
import Github.Object.StargazerConnection
import Github.Query as Query
import Github.Scalar
import Github.Union
import Github.Union.SearchResultItem
import Graphql.Field as Field exposing (Field)
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, fieldSelection, with, withFragment)
import Iso8601
import Time exposing (Posix)


type alias Repo =
    { nameWithOwner : String
    , description : Maybe String
    , stargazerCount : Int
    , timestamps : Timestamps
    , forkCount : Int
    , issues : Int
    , owner : Owner
    , url : Github.Scalar.Uri
    }


type SortOrder
    = Forks
    | Stars
    | Updated


query : SortOrder -> SelectionSet (List Repo) RootQuery
query sortOrder =
    Query.search (\optionals -> { optionals | first = Present 100 })
        { query = "language:Elm sort:" ++ (sortOrder |> Debug.toString |> String.toLower)
        , type_ = Github.Enum.SearchType.Repository
        }
        searchSelection
        |> fieldSelection


searchSelection : SelectionSet (List Repo) Github.Object.SearchResultItemConnection
searchSelection =
    Github.Object.SearchResultItemConnection.selection identity
        |> with thing


thing : Field.Field (List Repo) Github.Object.SearchResultItemConnection
thing =
    Github.Object.SearchResultItemConnection.nodes searchResultSelection
        |> Field.nonNullOrFail
        |> Field.map (List.filterMap identity)
        |> Field.map (List.filterMap identity)


withDefault : a -> Field.Field (Maybe a) typeLock -> Field.Field a typeLock
withDefault default =
    Field.map (Maybe.withDefault default)


searchResultSelection : SelectionSet (Maybe Repo) Github.Union.SearchResultItem
searchResultSelection =
    Github.Union.SearchResultItem.selection identity
        [ Github.Union.SearchResultItem.onRepository repositorySelection
        ]


repositorySelection : SelectionSet Repo Github.Object.Repository
repositorySelection =
    Repository.selection Repo
        |> with Repository.nameWithOwner
        |> with Repository.description
        |> with stargazers
        |> withFragment timestampsSelection
        |> with Repository.forkCount
        |> with openIssues
        |> with (Repository.owner ownerSelection)
        |> with Repository.url


type alias Timestamps =
    { created : Posix
    , updated : Posix
    }


timestampsSelection : SelectionSet Timestamps Github.Object.Repository
timestampsSelection =
    Repository.selection Timestamps
        |> with (Repository.createdAt |> mapToDateTime)
        |> with (Repository.updatedAt |> mapToDateTime)


mapToDateTime : Field Github.Scalar.DateTime typeLock -> Field Posix typeLock
mapToDateTime =
    Field.mapOrFail
        (\(Github.Scalar.DateTime value) ->
            Iso8601.toTime value
                |> Result.mapError (\_ -> "Failed to parse " ++ value ++ " as Iso8601 DateTime.")
        )


stargazers : Field Int Github.Object.Repository
stargazers =
    Repository.stargazers
        (\optionals -> { optionals | first = Present 0 })
        (fieldSelection Github.Object.StargazerConnection.totalCount)


openIssues : Field.Field Int Github.Object.Repository
openIssues =
    Repository.issues
        (\optionals -> { optionals | first = Present 0, states = Present [ Github.Enum.IssueState.Open ] })
        (fieldSelection Github.Object.IssueConnection.totalCount)


type alias Owner =
    { avatarUrl : Github.Scalar.Uri
    , login : String
    }


ownerSelection : SelectionSet Owner Github.Interface.RepositoryOwner
ownerSelection =
    Github.Interface.RepositoryOwner.commonSelection Owner
        |> with (Github.Interface.RepositoryOwner.avatarUrl identity)
        |> with Github.Interface.RepositoryOwner.login
