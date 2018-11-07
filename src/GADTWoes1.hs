{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}


{-@ LIQUID "--no-adt"                   @-}
{-@ LIQUID "--exact-data-con"           @-}
{-@ LIQUID "--higherorder"              @-}
{-@ LIQUID "--no-termination"           @-}

-- https://github.com/ucsd-progsys/liquidhaskell/issues/1295

module GADTWoes1 where

-- {-@
-- data Person = Person
--         { personNumber :: {v:Int | v > 0},
--           personNums :: {v:[Int] | len v > 0}
--         }
-- @-}
-- data Person = Person {
--   personNumber :: Int,
--   personNums :: [Int]
--   }


{-@
data EntityFieldPerson typ where
   PersonNumber :: EntityFieldPerson {v:_ | v > 0}
   | PersonNums :: EntityFieldPerson {v:_ | len v > 0}
@-}
data EntityFieldPerson typ
  = typ ~ Int => PersonNumber |
    typ ~ [Int] => PersonNums
