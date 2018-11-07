{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}

{-@ LIQUID "--no-adt"         @-}
{-@ LIQUID "--exact-data-con" @-}
{-@ LIQUID "--higherorder"    @-}
{-@ LIQUID "--no-termination" @-}
{-@ LIQUID "--no-totality"   @-}


--------------------------------------------------------------------------------
module GADTWoes0 where

class PersistEntity record where
    data EntityField record :: * -> *
    fooMeth :: EntityField record a -> Int

data Person = Person
  { personNumber :: Int
  , personName :: String
  , personNums :: [Int]
  }

instance PersistEntity Person where
  {-@ data EntityField Person typ where
        GADTWoes0.PersonNumber :: EntityField Person {v:_ | 0 <= v   }
      | GADTWoes0.PersonName   :: EntityField Person {v:_ | 0 < len v}
      | GADTWoes0.PersonNums   :: EntityField Person {v:_ | 0 < len v}
    @-}
  data EntityField Person typ
    = typ ~ Int => PersonNumber |
      typ ~ String => PersonName |
      typ ~ [Int] => PersonNums

  fooMeth PersonNums = 10
