module FooDivergeQ where

-- https://github.com/ucsd-progsys/liquidhaskell/issues/1333

{-@ foo1 :: i1:Int -> i2:Int -> Bool /  [( if (i2 - i1) >= 0 then (i2 - i1) else  0) ] @-}
foo1 :: Int -> Int -> Bool
foo1 i1 i2
  | i1 < i2   = foo1 i2 i1
  | otherwise = True

{-@ foo :: i1:_ -> i2:_ -> _ /  [if i2 > i1 then 1 else  0] @-}
foo :: (Ord a) => a -> a -> Bool
foo i1 i2
  | i1 < i2   = foo i2 i1
  | otherwise = True
