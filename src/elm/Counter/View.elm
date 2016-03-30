module Counter.View where

import Html exposing (..)
import Counter.Update exposing (..)
import Counter.Model exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

view : Signal.Address Action -> Model -> Html
view address model =
  div [] [ text (toString model) ]