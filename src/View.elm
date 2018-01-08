module View exposing (view)

import Matrix exposing (matrixAt)
import Model exposing (createHexOutput, Color, Model, Msg, ColorChangeEvent)
import Html exposing (div, button, text, Html, h1)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, style)
import Maybe exposing (withDefault)


colorToHex : Color -> String
colorToHex color =
    case color of
        Model.W ->
            "#9bbc0f"

        Model.L ->
            "#8bac0f"

        Model.D ->
            "#306230"

        Model.B ->
            "#0f380f"


createButton : Model -> Int -> Html Msg
createButton model index =
    let
        x =
            (index % 8)

        y =
            (index // 8)

        color =
            (matrixAt x y model.grid) |> Maybe.withDefault Model.W |> colorToHex
    in
        button [ onClick (Model.ColorChanged (ColorChangeEvent x y model.brush)), style [ ( "backgroundColor", color ) ] ]
            [ text <| toString <| withDefault Model.W <| matrixAt x y model.grid ]


createViewGrid : Model -> List (Html Msg)
createViewGrid model =
    List.range 0 63
        |> List.map (createButton model)


createPallete : Model -> Html Msg
createPallete model =
    div []
        [ button [ onClick (Model.BrushChanged Model.W), style [ ( "backgroundColor", (colorToHex Model.W) ) ] ] [ text "W" ]
        , button [ onClick (Model.BrushChanged Model.L), style [ ( "backgroundColor", (colorToHex Model.L) ) ] ] [ text "L" ]
        , button [ onClick (Model.BrushChanged Model.D), style [ ( "backgroundColor", (colorToHex Model.D) ) ] ] [ text "D" ]
        , button [ onClick (Model.BrushChanged Model.B), style [ ( "backgroundColor", (colorToHex Model.B) ) ] ] [ text "B" ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Grid" ]
        , createPallete model
        , div [ class "buttons" ]
            (createViewGrid model)
        , div [] (List.map (\x -> Html.p [] [ text x ]) (createHexOutput model))
        ]
