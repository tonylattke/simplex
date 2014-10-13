module Main where

import Control.Monad

import System.Environment
import System.IO

import Grammar
import Tokens
import Structures

takeAST :: AST -> [Declaration]
takeAST (AST l) = l

nameAST :: Declaration -> String
nameAST (Dec _ name _) = name

checkArgs [] = False
checkArgs (x:xs)
	| x == "-h" = True
	| otherwise = checkArgs xs

main :: IO ()
main = do
	-- Read the arguments
	args <- getArgs
	
	if checkArgs args
	then
		do
			putStrLn "Syntax:"
			putStrLn "\tsimplex <name_of_file>"
	else
		do
			-- Open file
			r <- openFile (head args) ReadMode
			t <- hGetContents r	

			-- Execute parser
			let tree = parseSimplex $ scanTokens t

			-- Read the AST information
			putStrLn "Name of variables:"
			mapM_ (putStrLn . nameAST) $ takeAST tree
	-- putStrLn ""