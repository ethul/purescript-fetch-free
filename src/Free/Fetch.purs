module Free.Fetch
  ( Fetch
  , FetchF(..)

  , fetch
  , text
  , json
  ) where

import Prelude

import Control.Monad.Free (Free, liftF)

import Data.Fetch.Response (Response, JSON)
import Data.Fetch.URL (URL)

type Fetch = Free FetchF

data FetchF a
  = Fetch URL (Response -> a)
  | Text Response (String -> a)
  | JSON Response (JSON -> a)

fetch :: URL -> Fetch Response
fetch url = liftF (Fetch url id)

text :: Response -> Fetch String
text res = liftF (Text res id)

json :: Response -> Fetch JSON
json res = liftF (JSON res id)
