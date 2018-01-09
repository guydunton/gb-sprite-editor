module TestMain exposing (..)

import Test exposing (..)
import MatrixTest exposing (matrixTests)


suite : Test
suite =
    describe "All the tests for the sprite editor"
        [ matrixTests
        ]
