{-@ LIQUID "--higherorder"    @-}
{-@ LIQUID "--exactdc"        @-}
{-@ LIQUID "--noadt"          @-}
module Axiomatize0 where

{-@
data Thing = TT { xThing :: Int }
@-}
data Thing = TT { xThing :: Int }

{-@
myThing :: {t:Thing | xThing t = 42}
@-}
myThing :: Thing
myThing = TT 42

{-@
crunch :: {x:Int | x = 42 }
@-}
crunch :: Int
crunch = xThing myThing
