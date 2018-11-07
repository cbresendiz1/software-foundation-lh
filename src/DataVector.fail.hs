module DataVector where

import Data.Vector
import Prelude hiding (length)
import Language.Haskell.Liquid.ProofCombinators

-- https://github.com/ucsd-progsys/liquidhaskell/issues/595
-- TODO : CR
-- {-@ (==.) :: x:a -> y:{a | x == y} ->
--       {o:a | o == y && o == x} @-}
--
-- (==.) :: a -> a -> a
-- _ ==. x = x

import Data.Vector

-- {-@
-- data Test = Test
--     { v  :: Vector ()
--     , x0 :: { x0 : Bool | vlen v < 1 ==> Prop x0 }
--     }
-- @-}

data Test = Test
    { v  :: Vector ()
    , x0 :: Bool
    }

example :: Test -> ()
example (Test v_ x0_) =
    if x0_
    then ()
    else v_ ! 0
