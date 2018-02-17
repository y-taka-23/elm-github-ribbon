module Demo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import GitHubRibbon as Ribbon


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type Msg
    = SetColor Ribbon.Color


type alias Model =
    { color : Ribbon.Color
    }


init : ( Model, Cmd Msg )
init =
    ( { color = Ribbon.Red }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update (SetColor col) m =
    ( { m | color = col }, Cmd.none )


view : Model -> Html Msg
view m =
    div
        [ style
            [ ( "width", "100vw" )
            , ( "height", "100vh" )
            , ( "display", "flex" )
            , ( "justify-content", "center" )
            , ( "align-items", "center" )
            ]
        ]
        [ Ribbon.ribbon
            { owner = "y-taka-23", repo = "elm-github-ribbon" }
            { position = Ribbon.Right, color = m.color }
        , panel
        ]


panel : Html Msg
panel =
    div
        [ style
            [ ( "width", "700px" )
            , ( "height", "140px" )
            , ( "display", "flex" )
            , ( "justify-content", "space-evenly" )
            , ( "align-items", "center" )
            , ( "border-style", "solid" )
            , ( "border-width", "1px" )
            , ( "border-color", "#6D6D6D" )
            , ( "border-radius", "10px" )
            ]
        ]
        [ picker "#AA0000" Ribbon.Red
        , picker "#007200" Ribbon.Green
        , picker "#121621" Ribbon.DarkBlue
        , picker "#FF7600" Ribbon.Orange
        , picker "#6D6D6D" Ribbon.Gray
        , picker "#FFFFFF" Ribbon.White
        ]


picker : String -> Ribbon.Color -> Html Msg
picker code col =
    if code == "#FFFFFF" then
        div
            [ onMouseOver (SetColor col)
            , style
                [ ( "background-color", code )
                , ( "width", "78px" )
                , ( "height", "78px" )
                , ( "border-style", "solid" )
                , ( "border-width", "1px" )
                , ( "border-color", "#6D6D6D" )
                , ( "border-radius", "10px" )
                ]
            ]
            []
    else
        div
            [ onMouseOver (SetColor col)
            , style
                [ ( "background-color", code )
                , ( "width", "80px" )
                , ( "height", "80px" )
                , ( "border-radius", "10px" )
                ]
            ]
            []


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
