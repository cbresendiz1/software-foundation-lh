{-@ LIQUID "--exactdc" @-}

module NotEq where

-- This should work : https://github.com/ucsd-progsys/liquidhaskell/issues/1220
{-@ unsafe :: {t : AB | not (isA t)} -> {t /= A}  @-}
unsafe :: AB -> ()
unsafe t | isA t = ()
unsafe _ = ()

{-@ safe :: {t : AB | not (isA t)} -> {not (t == A)}  @-}
safe :: AB -> ()
safe t | isA t = ()
safe _ = ()

{-@ measure isA @-}
isA :: AB -> Bool
isA A = True
isA B = False

data AB = A | B
