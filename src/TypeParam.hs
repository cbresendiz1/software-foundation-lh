{-@ LIQUID "--notermination" @-}

module TypeParam  where

-- more info at : https://github.com/ucsd-progsys/liquidhaskell/issues/1219
{-@ type IncrIntList = IncrList Int @-}
{-@ type IncrList a = [a]<{\xi xj -> xi <= xj}> @-}

{-@ insert :: Ord a => a -> IncrList a -> IncrList a @-}
insert :: Ord a => a -> [a] -> [a]
insert y []     = [y]
insert y (x:xs)
  | y <= x      = y : x : xs
  | otherwise   = x : insert y xs

-- {-@ insert' :: Int -> IncrList Int -> IncrList Int @-}
-- insert' :: Int -> [Int] -> [Int]
-- insert' y []     = [y]
-- insert' y (x:xs)
--   | y <= x      = y : x : xs
--   | otherwise   = x : insert' y xs


-- {-@ insert'' :: Int -> IncrList Int -> IncrList Int @-}
-- insert'' :: Int -> [Int] -> [Int]
-- insert'' y []     = [y]
-- insert'' y (x:xs)
--   | y <= x      = y : x : xs
--   | otherwise   = x : insert'' y xs

-- {-@ insertRECURSIVE :: Int -> IncrList Int -> IncrList Int @-}
-- insertRECURSIVE = undefined -- the implementation is ignored...
--
-- {-@ insert''' :: Int -> IncrList Int -> IncrList Int @-}
-- insert''' :: Int -> [Int] -> [Int]
-- insert''' y []     = [y]
-- insert''' y (x:xs)
--   | y <= x      = y : x : xs
--   | otherwise   = x : insertRECURSIVE y xs

-- {-@ insertPOLY :: a -> IncrList a -> IncrList a @-}
-- insertPOLY = undefined -- the implementation is ignored...

-- {-@ insert''' :: a -> IncrList a -> IncrList a @-}
{-@ insert''' :: forall <p :: Int -> Bool>. Int<p> -> IncrList (Int<p>) -> IncrList (Int<p>) @-}
insert''' :: Int -> [Int] -> [Int]
insert''' y []     = [y]
insert''' y (x:xs)
  | y <= x      = y : x : xs
  | otherwise   = x : insert''' y xs
