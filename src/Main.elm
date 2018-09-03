module Main exposing (main)

import Browser
import Matrix exposing (setMatrix)
import Model exposing (Model, Msg(..), init)
import View exposing (view)



-- Exposed Functions


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }



-- Private Functions


update : Msg -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
update msg ( model, cmd ) =
    case msg of
        ColorChanged e ->
            ( { model | grid = setMatrix e.x e.y e.color model.grid }, Cmd.none )

        BrushChanged b ->
            ( { model | brush = b }, Cmd.none )

        FillGrid ->
            ( { model | grid = Model.fillCanvas model.brush }, Cmd.none )

        Noop ->
            ( model, Cmd.none )
