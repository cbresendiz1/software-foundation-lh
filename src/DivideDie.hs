module DivideDie where

-- https://github.com/ucsd-progsys/liquidhaskell/issues/1297

{-@ type NonZero = {v:Int | v /= 0} @-}
{-@ die :: {v:String | false} -> a  @-}
die msg = error msg

{-@ divide :: Int -> NonZero -> Int @-}
divide :: Int -> Int -> Int                                 -- ADD THIS SIGNATURE
divide _ 0 = die "divide by zero"
divide n d = n `div` d
