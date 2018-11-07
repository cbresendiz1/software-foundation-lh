module DataTypeLen where

-- Look at https://github.com/ucsd-progsys/liquidhaskell/issues/1355
data List a = Emp               -- Nil
            | (:::) a (List a)  -- Cons

{-@ measure lengthx @-}
{-@ lengthx :: List a -> Int @-}
lengthx :: List a -> Int
lengthx Emp        = 0
lengthx (_ ::: xs) = 1 + lengthx xs

{-@
data List a where
    Emp :: {v:List a | lengthx v = 0}
    | (:::) :: x:a -> xs:List a -> {v:List a | lengthx v = 1 + lengthx xs}
@-}
