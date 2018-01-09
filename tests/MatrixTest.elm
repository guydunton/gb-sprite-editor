module MatrixTest exposing (matrixTests)

import Matrix exposing (..)
import Test exposing (..)
import Expect


-- Exposed Functions


matrixTests : Test
matrixTests =
    describe "Matrix Tests"
        [ test "matrixAt returns the correct value" <|
            \_ ->
                defaultMatrix
                    |> matrixAt 0 0
                    |> Expect.equal (Just 1)
        , test "matrixAt returns nothing outside the matrix" <|
            \_ ->
                defaultMatrix
                    |> matrixAt 6 6
                    |> Expect.equal Nothing
        , test "setMatrix correctly sets the value" <|
            \_ ->
                defaultMatrix
                    |> setMatrix 0 0 20
                    |> Expect.equal [ [ 20, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ]
        , test "setMatrix outside the matrix does nothing" <|
            \_ ->
                defaultMatrix
                    |> setMatrix 20 20 300
                    |> Expect.equal defaultMatrix
        ]



-- Private Functions


defaultMatrix : Matrix Int
defaultMatrix =
    [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ]
