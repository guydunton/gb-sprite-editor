module View exposing (view)

import Model exposing (..)
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)


createButton : Model -> Int -> Html Msg
createButton model index =
    let
        x =
            (index % 8)

        y =
            (index // 8)
    in
        button [ onClick (ColorChanged (ColorChangeEvent x y model.brush)) ]
            [ text <| toString <| matrixAt x y model.grid ]


createViewGrid : Model -> List (Html Msg)
createViewGrid model =
    List.range 0 63
        |> List.map (createButton model)


createPallete : Model -> Html Msg
createPallete model =
    div []
        [ button [ onClick (BrushChanged W) ] [ text "W" ]
        , button [ onClick (BrushChanged L) ] [ text "L" ]
        , button [ onClick (BrushChanged D) ] [ text "D" ]
        , button [ onClick (BrushChanged B) ] [ text "B" ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Grid" ]
        , createPallete model
        , div [ class "buttons" ]
            (createViewGrid model)
        , div [] [ text (createHexOutput model) ]
        ]
