module GitHubRibbon
    exposing
        ( Repository
        , Style
        , Position(..)
        , Color(..)
        , ribbon
        )

{-| Show the "Fork me on GitHub" ribbon in your Elm app.


# Element

@docs ribbon


# Configurations

@docs Repository, Style, Position, Color

-}

import Html exposing (..)
import Html.Attributes exposing (..)


{-| A ribbon as a piece of HTML.

    view : Model -> Html Msg
    view m =
        div []
            [ ribbon
                { owner = "y-taka-23", repo = "elm-github-ribbon" }
                { position = Right, color = Red }
            , ...
            ]

-}
ribbon : Repository -> Style -> Html msg
ribbon r s =
    a
        [ href <| toHref r ]
        [ img
            [ alt "Fork me on GitHub"
            , src <| toSrc s
            , style <| toStyle s.position
            ]
            []
        ]


{-| Repository on GitHub for linking to.
-}
type alias Repository =
    { owner : String
    , repo : String
    }


toHref : Repository -> String
toHref r =
    "https://github.com/" ++ r.owner ++ "/" ++ r.repo


{-| Sytle of the ribbon.
-}
type alias Style =
    { position : Position
    , color : Color
    }


toSrc : Style -> String
toSrc s =
    "https://s3.amazonaws.com/github/ribbons/forkme_"
        ++ position s.position
        ++ "_"
        ++ color s.color
        ++ ".png"


{-| Position of the ribbon. The left-top or right-top corner of a page.
-}
type Position
    = Left
    | Right


toStyle : Position -> List ( String, String )
toStyle pos =
    [ ( "position", "absolute" )
    , ( "top", "0" )
    , ( position pos, "0" )
    , ( "border", "0" )
    ]


position : Position -> String
position pos =
    case pos of
        Left ->
            "left"

        Right ->
            "right"


{-| Color of the ribbon. Six colors are provided by GitHub.
-}
type Color
    = Red
    | Green
    | DarkBlue
    | Orange
    | Gray
    | White


color : Color -> String
color col =
    case col of
        Red ->
            "red_aa0000"

        Green ->
            "green_007200"

        DarkBlue ->
            "darkblue_121621"

        Orange ->
            "orange_ff7600"

        Gray ->
            "gray_6d6d6d"

        White ->
            "white_ffffff"
