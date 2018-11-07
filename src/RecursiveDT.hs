{-@ LIQUID "--exactdc"  @-}
module RecursiveDT where

data Pred l
  = PTerm (Term l)

data Term l
  = TPred (Pred l)

  | TTer  (Term l)

{-@ measure tsize @-}
tsize :: Term l -> Int

{-@ tsize :: Term l -> Nat @-}
tsize (TPred _)            = 0
