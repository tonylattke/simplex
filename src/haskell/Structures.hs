module Structures where

data AST = AST [Declaration]
           deriving Show

data Declaration = Dec Type String (Maybe Value)
                   deriving Show

data Type = TStr
          | TInt
          deriving Show

data Value = Int Int
           | Str String
           deriving Show