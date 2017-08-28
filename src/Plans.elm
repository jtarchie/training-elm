module Plans exposing (..)

import Workout exposing (..)


plan : Plan
plan =
    { name = "Ultraladies 100 miles"
    , routine =
        [ [ Miles 0, Miles 4, Miles 6, Miles 4, Miles 0, Miles 16, Miles 10 ]
        , [ Miles 0, Miles 4, Miles 6, Miles 4, Miles 0, Miles 18, Miles 10 ]
        , [ Miles 0, Miles 4, Miles 6, Miles 4, Miles 0, Miles 20, Miles 10 ]
        , [ Miles 0, Miles 2, Miles 4, Miles 6, Miles 0, Miles 10, Miles 8 ]
        , [ Miles 0, Miles 4, Miles 8, Miles 6, Miles 0, Miles 20, Miles 12 ]
        , [ Miles 0, Miles 4, Miles 8, Miles 6, Miles 0, Miles 22, Miles 12 ]
        , [ Miles 0, Miles 4, Miles 8, Miles 6, Miles 0, Miles 22, Miles 12 ]
        , [ Miles 0, Miles 2, Miles 4, Miles 6, Miles 0, Miles 10, Miles 8 ]
        , [ Miles 0, Miles 4, Miles 10, Miles 6, Miles 0, Miles 25, Miles 13 ]
        , [ Miles 0, Miles 4, Miles 10, Miles 6, Miles 0, Miles 25, Miles 13 ]
        , [ Miles 0, Miles 4, Miles 10, Miles 6, Miles 0, Miles 25, Miles 13 ]
        , [ Miles 0, Miles 4, Miles 8, Miles 6, Miles 0, Miles 10, Miles 8 ]
        , [ Miles 0, Miles 4, Miles 12, Miles 6, Miles 0, Miles 28, Miles 15 ]
        , [ Miles 0, Miles 4, Miles 12, Miles 6, Miles 0, Miles 28, Miles 15 ]
        , [ Miles 0, Miles 4, Miles 12, Miles 6, Miles 0, Miles 28, Miles 15 ]
        , [ Miles 0, Miles 4, Miles 8, Miles 6, Miles 0, Miles 10, Miles 8 ]
        , [ Miles 0, Miles 4, Miles 15, Miles 6, Miles 0, Miles 30, Miles 15 ]
        , [ Miles 0, Miles 4, Miles 15, Miles 6, Miles 0, Miles 30, Miles 15 ]
        , [ Miles 0, Miles 4, Miles 15, Miles 6, Miles 0, Miles 30, Miles 20 ]
        , [ Miles 0, Miles 4, Miles 8, Miles 6, Miles 0, Miles 10, Miles 8 ]
        , [ Miles 0, Miles 4, Miles 15, Miles 6, Miles 0, Miles 30, Miles 20 ]
        , [ Miles 0, Miles 4, Miles 15, Miles 6, Miles 0, Miles 30, Miles 20 ]
        , [ Miles 0, Miles 4, Miles 10, Miles 6, Miles 0, Miles 10, Miles 10 ]
        , [ Miles 0, Miles 4, Miles 0, Miles 6, Miles 0, Miles 10, Miles 0 ]
        , [ Miles 5, Miles 3, Miles 2, Miles 0, Miles 0, Miles 100, Miles 0 ]
        ]
    }
