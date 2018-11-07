module LazyVarExample where

-- https://github.com/ucsd-progsys/liquidhaskell/issues/1337
-- {-@ safeDivFail :: Int -> {v:Int | v /= 0} -> Int @-}
-- safeDivFail :: Int -> Int -> Int
-- safeDivFail x y
--   | y == 0 = help
--   | otherwise = x `div` y
--   where
--     help = error "lol"

{-@ safeDiv :: Int -> {v:Int | v /= 0} -> Int @-}
safeDiv :: Int -> Int -> Int
safeDiv x y
  | y == 0 = help
  | otherwise = x `div` y
  where
   {-@ lazyvar help @-}
    help = error "lol"
