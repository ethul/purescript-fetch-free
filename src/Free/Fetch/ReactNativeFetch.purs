module Free.Fetch.ReactNativeFetch (reactNativeFetch) where

import Prelude

import Control.Monad.Aff (Aff)
import Control.Monad.Aff.Compat (EffFnAff, fromEffFnAff)

import Data.Fetch.Response (Response, JSON)
import Data.Newtype (unwrap)

import Free.Fetch (FetchF(..))

reactNativeFetch :: forall eff. FetchF ~> Aff eff
reactNativeFetch =
  case _ of
       Fetch url k -> k <$> fromEffFnAff (fetch (unwrap url))
       Text res k -> k <$> fromEffFnAff (text res)
       JSON res k -> k <$> fromEffFnAff (json res)

foreign import fetch :: forall eff. String -> EffFnAff eff Response

foreign import text :: forall eff. Response -> EffFnAff eff String

foreign import json :: forall eff. Response -> EffFnAff eff JSON
