{-@ LIQUID "--exactdc" @-}
{-@ LIQUID "--ple"     @-}

module Maybe where
-- really good example
-- https://github.com/ucsd-progsys/liquidhaskell/issues/1264
-- So LH requires that some values are decreasing [ look for link ]
-- kind of like coq
data Maybe2 a = Nothing2 | Just2 a

{-@ reflect isJust2 @-}
isJust2 :: Maybe2 a -> Bool
isJust2 (Just2 _) = True
isJust2 Nothing2  = False

{-@ fromJust :: { m:Maybe2 a | isJust2 m } -> a @-}
fromJust :: Maybe2 a -> a
fromJust (Just2 x) = x
fromJust Nothing2  = error "Nothing"
