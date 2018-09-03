module Model exposing (Canvas, Color(..), ColorChangeEvent, Model, Msg(..), createCanvas, fillCanvas, init, splitInTwo)

import Matrix exposing (Matrix)



-- Exposed Types


type Msg
    = ColorChanged ColorChangeEvent
    | BrushChanged Color
    | FillGrid
    | Noop


type Color
    = W -- White
    | L -- Light Grey
    | D -- Dark Grey
    | B -- Black


type alias Canvas =
    Matrix Color


type alias ColorChangeEvent =
    { x : Int
    , y : Int
    , color : Color
    }


type alias Model =
    { grid : Canvas
    , brush : Color
    }



-- Exposed Functions


splitInTwo : List a -> List (List a)
splitInTwo list =
    let
        partSize =
            List.length list // 2
    in
    [ List.take partSize list, List.drop partSize list ]


init : ( Model, Cmd Msg )
init =
    ( Model (fillCanvas W) B, Cmd.none )


fillCanvas : Color -> Canvas
fillCanvas color =
    List.repeat 8 color |> List.repeat 8



-- Private Functions


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
