module Workout exposing (..)

import Date exposing (Date)
import Date.Extra exposing (Interval(..))
import List.Extra exposing (find)


type Mileage
    = Miles Float
    | Kilometers Float


type alias Workout =
    { mileage : Mileage
    , notes : String
    }


type alias DailyWorkout =
    { date : Date, workout : Workout }


type alias WeeklyMileage =
    List Mileage


type alias Plan =
    { name : String
    , routine : List WeeklyMileage
    }


type alias Routine =
    { actual : DailyWorkout
    , expected : DailyWorkout
    }


expectedWorkouts : List Mileage -> Date -> List DailyWorkout
expectedWorkouts miles date =
    case miles of
        [] ->
            []

        m :: xs ->
            { date = date
            , workout =
                { mileage = m
                , notes = ""
                }
            }
                :: expectedWorkouts xs (Date.Extra.add Day 1 date)


initWorkout : Date -> DailyWorkout
initWorkout date =
    DailyWorkout date (Workout (Miles 0) "")


convert : List DailyWorkout -> List DailyWorkout -> List Routine
convert expected actual =
    List.map
        (\e ->
            case find (\a -> a.date == e.date) actual of
                Just a ->
                    { actual = a, expected = e }

                Nothing ->
                    { actual = initWorkout e.date, expected = e }
        )
        expected


routines : Plan -> List DailyWorkout -> Date -> List Routine
routines plan workouts startDate =
    convert (expectedWorkouts (List.concat plan.routine) startDate) workouts
