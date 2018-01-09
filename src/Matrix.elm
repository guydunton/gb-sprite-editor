module Matrix exposing (Matrix, setMatrix, matrixAt)

import Array
import Maybe exposing (andThen)


-- Exposed Type


type alias Matrix a =
    List (List a)



-- Exposed Functions


matrixAt : Int -> Int -> Matrix a -> Maybe a
matrixAt x y canvas =
    listAt y canvas
        |> andThen (listAt x)


setMatrix : Int -> Int -> a -> Matrix a -> Matrix a
setMatrix x y val grid =
    let
        line =
            listAt y grid
    in
        case line of
            Nothing ->
                grid

            Just data ->
                grid
                    |> listSet y (listSet x val data)



-- Private Functions


listSet : Int -> a -> List a -> List a
listSet index val list =
    list
        |> Array.fromList
        |> Array.set index val
        |> Array.toList


listAt : Int -> List a -> Maybe a
listAt index list =
    list
        |> Array.fromList
        |> Array.get index
