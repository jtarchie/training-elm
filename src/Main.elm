module Main exposing (main)

import Date exposing (Date)
import Html exposing (..)
import Html.Attributes exposing (..)
import Plans exposing (..)
import Workout exposing (..)
import Date.Extra


type alias Model =
    { plan : Plan
    , workouts : List DailyWorkout
    , startDate : Date
    }


type Msg
    = Init


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


date : String -> Date
date s =
    Date.fromString s |> Result.withDefault (Date.fromTime 0)


workouts : List DailyWorkout
workouts =
    [ { date = date "2017/01/01"
      , workout =
            { mileage = Miles 1.0
            , notes = "hard and hot"
            }
      }
    , { date = date "2017/01/02"
      , workout =
            { mileage = Kilometers 2.0
            , notes = "nice and easy"
            }
      }
    ]


init : ( Model, Cmd Msg )
init =
    ( Model plan workouts (date "2016/12/27"), Cmd.none )


optionForMileage : Mileage -> Mileage -> Html Msg
optionForMileage actual expected =
    let
        unit =
            case expected of
                Miles _ ->
                    "miles"

                Kilometers _ ->
                    "km"
    in
        option [ value unit, selected (actual == expected) ] [ text unit ]


viewDistance : Mileage -> Html Msg
viewDistance mileage =
    let
        copy =
            case mileage of
                Miles d ->
                    (toString d) ++ " miles"

                Kilometers d ->
                    (toString d) ++ " km"
    in
        span [] [ text copy ]


editDistance : Mileage -> List (Html Msg)
editDistance mileage =
    let
        distance =
            case mileage of
                Miles d ->
                    d

                Kilometers d ->
                    d
    in
        [ input
            [ class "form-control"
            , type_ "number"
            , value (toString distance)
            , autocomplete False
            , spellcheck False
            , step "any"
            ]
            []
        , select [ class "custom-select", class "form-control" ]
            [ optionForMileage mileage (Miles distance)
            , optionForMileage mileage (Kilometers distance)
            ]
        ]


viewNotes : Routine -> Html Msg
viewNotes routine =
    input
        [ class "form-control"
        , type_ "text"
        , value routine.actual.workout.notes
        , autocomplete False
        ]
        []


viewRoutine : Routine -> Html Msg
viewRoutine routine =
    tr []
        [ td [] [ text (toString (Date.dayOfWeek routine.expected.date)) ]
        , td [] [ text (Date.Extra.toFormattedString "MM/dd" routine.expected.date) ]
        , td [ class "form-group", class "form-inline" ] [ viewDistance routine.expected.workout.mileage ]
        , td [] [ text routine.expected.workout.notes ]
        , td [ class "form-group", class "form-inline" ] (editDistance routine.actual.workout.mileage)
        , td [ class "form-group", class "form-inline" ] [ viewNotes routine ]
        ]


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ table [ class "table", class "table-striped", class "table-condensed" ]
            [ thead []
                [ tr []
                    [ th [] [ text "Day" ]
                    , th [] [ text "Date" ]
                    , th [] [ text "Scheduled" ]
                    , th [] []
                    , th [] [ text "Actual" ]
                    , th [] [ text "Notes" ]
                    ]
                ]
            , tbody [] (List.map viewRoutine (routines model.plan model.workouts model.startDate))
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
