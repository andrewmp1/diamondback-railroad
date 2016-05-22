module Board exposing (model)

import Html exposing (Html, button, div, text, input, h2)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import Html.App as Html
import Svg exposing (..)
import Svg.Attributes exposing (..)


-- import String exposing (toInt)

import Square


main : Program Never
main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias NumSquares =
    String


type alias Height =
    String


type alias Width =
    String


type alias Model =
    { squares : NumSquares
    , height : Height
    , width : Width
    }


model : Model
model =
    { squares = "11"
    , height = "400"
    , width = "400"
    }



-- UPDATE


type Msg
    = Renumber NumSquares
    | Rewidth Width


update : Msg -> Model -> Model
update msg model =
    case msg of
        Renumber squares ->
            { model | squares = squares }

        Rewidth px ->
            { model | width = px, height = px }



-- VIEW


view : Model -> Html Msg
view model =
    div [ Html.Attributes.style [ ( "border", "solid" ) ] ]
        [ viewPort model
        , h2 [] [ Html.text "squares" ]
        , input [ placeholder model.squares, onInput Renumber ] []
        , h2 [] [ Html.text "size" ]
        , input [ placeholder model.width, onInput Rewidth ] []
        ]


viewPort : Model -> Html.Html msg
viewPort model =
    svg
        [ width model.width
        , height model.height
        ]
        [ rect
            [ stroke "blue"
            , fill "white"
            , width model.width
            , height model.height
            ]
            []
        , Square.init 0 0 50 |> Square.square
        , Square.init 0 1 50 |> Square.square
        , Square.init 1 0 50 |> Square.square
        , Square.init 1 1 50 |> Square.square
        ]