module Pos where

-- extra equation for n==0 case
pos1 :: Int -> Int
pos1 n
  | n <  0    = 0
  | n == 0    = 1
  | otherwise = 1 + pos1 (n-1)

-- explicit metric
{-@ pos :: n:_ -> _ / [n+1] @-}
pos :: Int -> Int
pos n
  | n <  0    = 0
  | otherwise = 1 + pos (n-1)
