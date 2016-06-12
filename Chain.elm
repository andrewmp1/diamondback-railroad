module Chain exposing (Model, init, update, subscriptions)

import Html exposing (Html)
import Piece exposing (Msg)
import AnimationFrame
import Time exposing (Time)
import Style


type alias Model =
    List Piece.Model


init : ( Model, Cmd Msg )
init =
    ( [], Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    AnimationFrame.times Animate


type Msg
    = Show
    | Animate Time
    | Up
    | Right
    | Down
    | Left


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        result =
            case msg of
                Up ->
                    model

                Right ->
                    model

                Down ->
                    model

                Left ->
                    model

                Show ->
                    model

                Animate time ->
                    model
    in
        ( result, Cmd.none )
