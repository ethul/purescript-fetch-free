module Data.Fetch.URL where

import Prelude

import Data.Monoid (class Monoid)
import Data.Newtype (class Newtype)

newtype URL = URL String

derive instance eqURL :: Eq URL

derive instance ordURL :: Ord URL

derive instance newtypeURL :: Newtype URL _

derive newtype instance semigroupURL :: Semigroup URL

derive newtype instance monoidURL :: Monoid URL
