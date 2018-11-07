module Bug where
-- https://github.com/ucsd-progsys/liquidhaskell/issues/1228
import Language.Haskell.Liquid.ProofCombinators

{-@ class VerifiedEq a where
      refl :: x :a -> {x == x}
  @-}
class VerifiedEq a where
--  eq :: a -> a -> Bool
  refl :: a -> Proof
