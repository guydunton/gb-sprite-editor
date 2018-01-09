module View exposing (view)

import Matrix exposing (matrixAt)
import Model exposing (Color(..), Model, Msg(..), ColorChangeEvent)
import Sprite exposing (createHexOutput)
import Html exposing (div, button, text, Html, h1)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, style)
import Maybe exposing (withDefault)


-- Exposed Functions


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Grid" ]
        , createPallete model
        , div [ class "buttons" ]
            (createViewGrid model)
        , div [] (List.map (\x -> Html.p [] [ text x ]) (createHexOutput model.grid))
        ]



-- Private Functions


colorToHex : Color -> String
colorToHex color =
    case color of
        W ->
            "#9bbc0f"

        L ->
            "#8bac0f"

        D ->
            "#306230"

        B ->
            "#0f380f"


createButton : Model -> Int -> Html Msg
createButton model index =
    let
        x =
            (index % 8)

        y =
            (index // 8)

        color =
            (matrixAt x y model.grid) |> withDefault W |> colorToHex
    in
        button [ onClick (ColorChanged (ColorChangeEvent x y model.brush)), style [ ( "backgroundColor", color ) ] ]
            [ text <| toString <| withDefault W <| matrixAt x y model.grid ]


createViewGrid : Model -> List (Html Msg)
createViewGrid model =
    List.range 0 63
        |> List.map (createButton model)


createPallete : Model -> Html Msg
createPallete model =
    div []
        [ button [ onClick (BrushChanged W), style [ ( "backgroundColor", (colorToHex W) ) ] ] [ text "W" ]
        , button [ onClick (BrushChanged L), style [ ( "backgroundColor", (colorToHex L) ) ] ] [ text "L" ]
        , button [ onClick (BrushChanged D), style [ ( "backgroundColor", (colorToHex D) ) ] ] [ text "D" ]
        , button [ onClick (BrushChanged B), style [ ( "backgroundColor", (colorToHex B) ) ] ] [ text "B" ]
        ]
