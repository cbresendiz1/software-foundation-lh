{-@ LIQUID "--higherorder"    @-}
{-@ LIQUID "--exactdc"        @-}
{-@ LIQUID "--noadt"          @-}

{-@ LIQUID "--ple"            @-}
-- You need this for generating equivalent
-- Proofs for Axiomatize0.hs
-- https://github.com/ucsd-progsys/liquidhaskell/issues/1239

module Axiomatize1 where
{-@
data Thing2 = TT2 { xThing2 :: Int }
@-}
data Thing2 = TT2 { xThing2 :: Int }

{-@
axiomatize myThing2
@-}
myThing2 :: Thing2
myThing2 = TT2 42

{-@
crunch2 :: {x:Int | x = 42 }
@-}
crunch2 :: Int
crunch2 = xThing2 myThing2
