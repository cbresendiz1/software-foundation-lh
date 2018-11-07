module MeasureListList where

{-@ LIQUID "--prune-unsorted" @-}
-- need 'prune-unsorted' flag to
-- allow measures that are defined
-- on datatypes of datatypes

{-@ measure llen @-}
llen :: [a] -> Int
llen [] = 0
llen (x:xs) = 1 + llen xs

{-@ measure f @-}
f :: [[a]] -> Int
f [] = 0
f (x:xs) = llen x + f xs
