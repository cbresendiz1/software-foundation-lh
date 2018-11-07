module Omega where

-- https://github.com/ucsd-progsys/liquidhaskell/issues/159

import qualified Data.Map as Map
import Data.Map (Map, (!))

-- | Standard domain for LC + Bool
data D = B Bool | L (D -> D) | Wrong

instance Show D where
  show (B b) = show b
  show (L _) = "<function>"
  show Wrong = "oops"

-- | Syntax for Lambda calculus
type VarName = String
data LC =
    Var VarName
  | App LC LC
  | Lam VarName LC
  | Bool Bool
  | If LC LC LC
  deriving (Eq, Ord, Show)
{-@ data LC [size] @-}

-- | Simple size measure
--
-- >>> size (Var "x")
-- 1
-- >>> size littleOmega
-- 4
-- >>> size omega
-- 9
size :: LC -> Int
size (Var _) = 1
size (App e1 e2) = 1 + size e1 + size e2
size (Lam x e) = 1 + size e
size (Bool _) = 1
size (If e1 e2 e3) = 1 + size e1 + size e2 + size e3
{-@ measure size @-}
{-@ size :: e:LC -> {v : Nat | v = size e} @-}

type Env = Map VarName D

-- | Standard denotational model of LC + Bool
--
-- >>> eval Map.empty (Lam "x" (Var "x"))
-- <function>
-- >>> eval Map.empty (App (Lam "x" (Var "x")) (Bool True))
-- True
{-@ eval :: Env -> e:LC -> D / [ size e ] @-}
eval :: Env -> LC -> D
eval env (Var x) = env ! x
eval env (App e1 e2) =
  case eval env e1 of
    L f -> f $ eval env e2
    _ -> Wrong
eval env (Lam x e) = L $ \v -> eval (Map.insert x v env) e
eval _   (Bool b) = B b
eval env (If e1 e2 e3) =
  case eval env e1 of
    B b -> eval env (if b then e2 else e3)
    _ -> Wrong

-- | We go off the rails... Liquid Haskell said we'd be safe! :(
littleOmega, omega :: LC
littleOmega = Lam "x" (App (Var "x") (Var "x"))
omega = App littleOmega littleOmega

oops = eval Map.empty omega
