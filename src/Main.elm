module Main exposing (main)

import Matrix exposing (setMatrix)
import Model exposing (Model, Msg, init)
import View exposing (view)
import Html exposing (program)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Model.ColorChanged e ->
            ( { model | grid = (setMatrix e.x e.y e.color model.grid) }, Cmd.none )

        Model.BrushChanged b ->
            ( { model | brush = b }, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\x -> Sub.none)
        }
