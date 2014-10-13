all: simplex

Tokens.hs : Tokens.x
	alex Tokens.x

Grammar.hs : Grammar.y
	happy Grammar.y
    
simplex : Tokens.hs Grammar.hs simplex.hs
	ghc --make simplex
    
clean:
	rm -f simplex Grammar.hs Tokens.hs *.o *.hi
