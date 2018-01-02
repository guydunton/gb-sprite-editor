module Main exposing (main)

import Html exposing (text, div, p)
import Bitwise exposing (shiftLeftBy)


-- Types


type Binary
    = Zero
    | One


type Color
    = W
    | L
    | D
    | B


type alias Canvas =
    List (List Color)


type alias HexCharacter =
    Char


type alias HexPair =
    String



-- Functions


splitInTwo : List a -> List (List a)
splitInTwo list =
    let
        partSize =
            (List.length list) // 2
    in
        [ (List.take partSize list), (List.drop partSize list) ]


toHex : Int -> HexCharacter
toHex value =
    case value of
        0 ->
            '0'

        1 ->
            '1'

        2 ->
            '2'

        3 ->
            '3'

        4 ->
            '4'

        5 ->
            '5'

        6 ->
            '6'

        7 ->
            '7'

        8 ->
            '8'

        9 ->
            '9'

        10 ->
            'a'

        11 ->
            'b'

        12 ->
            'c'

        13 ->
            'd'

        14 ->
            'e'

        15 ->
            'f'

        _ ->
            '0'


binToHex : List Binary -> HexPair
binToHex bits =
    let
        bitToInt bit =
            case bit of
                Zero ->
                    0

                One ->
                    1

        shiftValuesByLocation vals =
            case vals of
                [] ->
                    []

                val :: rest ->
                    (shiftLeftBy (List.length rest) val) :: (shiftValuesByLocation rest)
    in
        bits
            |> List.map bitToInt
            |> shiftValuesByLocation
            |> List.sum
            |> toHex
            |> String.fromChar


createCanvas : Canvas
createCanvas =
    [ [ B, B, L, L, D, D, B, B ]
    , [ B, B, W, W, W, B, B, W ]
    , [ B, B, W, W, W, B, B, W ]
    , [ B, B, B, B, D, D, L, L ]
    , [ B, B, B, B, D, D, L, L ]
    , [ B, B, W, W, W, B, B, W ]
    , [ B, B, W, W, W, B, B, W ]
    , [ B, B, W, W, W, B, B, W ]
    ]


convertLineToBinary : List Color -> List ( Binary, Binary )
convertLineToBinary values =
    values
        |> List.map
            (\value ->
                case value of
                    W ->
                        ( Zero, Zero )

                    L ->
                        ( Zero, One )

                    D ->
                        ( One, Zero )

                    B ->
                        ( One, One )
            )


hexFromBinary : List Binary -> HexPair
hexFromBinary binaryData =
    binaryData
        |> splitInTwo
        |> List.map binToHex
        |> String.concat


convertBinaryLineToHex : List ( Binary, Binary ) -> List String
convertBinaryLineToHex line =
    let
        ( mostSignificantBits, leastSignificantBits ) =
            List.unzip line
    in
        [ hexFromBinary mostSignificantBits, hexFromBinary leastSignificantBits ]
            |> List.reverse


main : Html.Html msg
main =
    let
        canvas =
            createCanvas
                |> List.map convertLineToBinary
                |> List.map convertBinaryLineToHex
                |> List.concat
                |> List.map (\x -> "$" ++ x)
                |> String.join ","
    in
        div []
            [ p [] [ text canvas ]
            ]
