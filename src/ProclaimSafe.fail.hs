module ProclaimSafe where

data Fix a = Fix {unFix :: Fix a -> a}

--absurd :: (Show a) => a -> a
--absurd _ = unFix (Fix (\x -> unFix x x)) (Fix (\x -> unFix x x))

-- main = putStrLn $ show (absurd "a")
