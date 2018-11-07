{-@ LIQUID "--exactdc"        @-}
{-@ LIQUID "--no-termination" @-}
{-@ LIQUID "--ple"            @-}

module Blank where
-- https://github.com/ucsd-progsys/liquidhaskell/issues/1289
-- This explains proving via reflections and pattern matching
data IntList = Nil | Cons Int IntList

data Bar = C IntList IntList

{-@ data Baz = D { db :: {v:Bar | isEqBar v} } @-}
data Baz = D Bar

{-@ reflect isEqBar @-}
isEqBar :: Bar -> Bool
isEqBar (C Nil Nil)                 = True
isEqBar (C (Cons x xs) (Cons y ys)) = x == y && isEqBar (C xs ys)
isEqBar (C _ _)                     = False

test =
  [ D (C Nil Nil)                                     -- OK
  , D (C (Cons 0 Nil) (Cons 0 Nil))                   -- OK
  , D (C (Cons 1 Nil) (Cons 1 Nil))                   -- OK
  , D (C (Cons 0 (Cons 0 Nil)) (Cons 0 (Cons 0 Nil))) -- OK
--  , D (C Nil (Cons 0 Nil))                            -- BAD
--  , D (C (Cons 0 Nil) Nil)                            -- BAD
  ]
