module View exposing (view)

import Matrix exposing (matrixAt)
import Model exposing (Color(..), Model, Msg(..), ColorChangeEvent, Canvas)
import Sprite exposing (createHexOutput)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Maybe exposing (..)
import Json.Decode as Json


-- Exposed Functions


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Gameboy Sprite Editor" ]
        , createPallete
        , div [ class "buttons" ]
            (createViewGrid model)
        , createOutput model.grid
        ]



-- Private Functions


colorToHex : Color -> String
colorToHex color =
    case color of
        W ->
            "#9bbc0f"

        L ->
            "#83a30e"

        D ->
            "#306230"

        B ->
            "#0f380f"


onTouchStart : a -> Attribute a
onTouchStart action =
    on "touchstart" (Json.succeed action)


onTouchEnd : a -> Attribute a
onTouchEnd action =
    on "touchend" (Json.succeed action)


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
        button
            [ onMouseDown (ColorChanged (ColorChangeEvent x y model.brush))
            , style [ ( "backgroundColor", color ) ]
            , onMouseUp Noop
            , onTouchStart (ColorChanged (ColorChangeEvent x y model.brush))
            , onTouchEnd Noop
            ]
            []


createViewGrid : Model -> List (Html Msg)
createViewGrid model =
    List.range 0 63
        |> List.map (createButton model)


createPallete : Html Msg
createPallete =
    div [ class "pallete" ]
        [ p [] [ text "pallete" ]
        , button [ onClick (BrushChanged W), style [ ( "backgroundColor", (colorToHex W) ) ] ] [ text "W" ]
        , button [ onClick (BrushChanged L), style [ ( "backgroundColor", (colorToHex L) ) ] ] [ text "L" ]
        , button [ onClick (BrushChanged D), style [ ( "backgroundColor", (colorToHex D) ) ] ] [ text "D" ]
        , button [ onClick (BrushChanged B), style [ ( "backgroundColor", (colorToHex B) ) ] ] [ text "B" ]
        ]


createOutput : Canvas -> Html Msg
createOutput canvas =
    div [ class "output" ]
        ((createHexOutput canvas)
            |> List.map (\x -> Html.p [] [ text x ])
            |> (::) (Html.p [] [ text "Output" ])
        )
