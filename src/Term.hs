module Term where

-- Measure Invariants : https://github.com/ucsd-progsys/liquidhaskell/issues/1198
{-@ data Tree [sz] @-}
data Tree = Leaf | Node Tree Tree

{-@ measure sz @-}
{-@ sz :: Tree -> Nat @-}
sz :: Tree -> Int
sz Leaf = 0
sz (Node t1 t2) = 1 + sz t1 + sz t2

-- {-@ invariant {v:Tree | 0 <= sz v } @-}
