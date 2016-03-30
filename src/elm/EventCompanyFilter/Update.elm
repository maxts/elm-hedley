module EventCompanyFilter.Update where

import EventCompanyFilter.Model as EventCompanyFilter exposing (initialModel, Model)

import Company.Model as Company exposing (Model)
import Counter.Model as Counter exposing (Model)
import Counter.Update as Counter exposing (update)


init : Model
init = initialModel

type Action
  = SelectCompany (Maybe Int)

type alias Model = EventCompanyFilter.Model

update : Counter.Model -> List Company.Model -> Action -> Model -> Model
update counter companies action model =
  case action of
    SelectCompany maybeCompanyId ->
      let
        counter = Counter.update Counter.Increment
        test' = Debug.log "one" counter

        isValidCompany val =
          companies
            |> List.filter (\company -> company.id == val)
            |> List.length

        eventCompanyFilter =
          case maybeCompanyId of
            Just val ->
              -- Make sure the given company ID is a valid one.
              if ((isValidCompany val) > 0)
                then Just val
                else Nothing
            Nothing ->
              Nothing
      in
        eventCompanyFilter
