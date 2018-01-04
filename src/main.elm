module Main exposing (main)

import Model exposing (..)
import View exposing (view)
import Html exposing (program)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ColorChanged e ->
            ( { model | grid = (setMatrix e.x e.y e.color model.grid) }, Cmd.none )

        BrushChanged b ->
            ( { model | brush = b }, Cmd.none )


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\x -> Sub.none)
        }
