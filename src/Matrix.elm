module Matrix exposing (..)

import Array
import Maybe exposing (andThen)


type alias Matrix a =
    List (List a)


listSet : Int -> a -> List a -> List a
listSet index val list =
    list
        |> Array.fromList
        |> Array.set index val
        |> Array.toList


setMatrix : Int -> Int -> a -> Matrix a -> Matrix a
setMatrix x y col grid =
    let
        line =
            listAt y grid
    in
        case line of
            Nothing ->
                grid

            Just data ->
                grid
                    |> listSet y (listSet x col data)


listAt : Int -> List a -> Maybe a
listAt index list =
    list
        |> Array.fromList
        |> Array.get index


matrixAt : Int -> Int -> Matrix a -> Maybe a
matrixAt x y canvas =
    listAt y canvas
        |> andThen (listAt x)
