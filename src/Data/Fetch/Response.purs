module Data.Fetch.Response
  ( Response
  , JSON

  , ok
  , status
  , statusText
  ) where

import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)

newtype Response = Response (Response' Response_)

foreign import data Response' :: # Type -> Type

foreign import data TextBody :: Type

foreign import data JSONBody :: Type

foreign import data JSON :: Type

type Response_
  = ( ok :: Boolean
    , status :: Int
    , statusText :: String
    )

ok :: Response -> Boolean
ok (Response a) = get (SProxy :: SProxy "ok") a

status :: Response -> Int
status (Response a) = get (SProxy :: SProxy "status") a

statusText :: Response -> String
statusText (Response a) = get (SProxy :: SProxy "statusText") a

get
  :: forall l r s a
   . RowCons l a r s
  => IsSymbol l
  => SProxy l
  -> Response' s
  -> a
get l r = unsafeGet (reflectSymbol l) r

foreign import unsafeGet :: forall r a. String -> Response' r -> a
