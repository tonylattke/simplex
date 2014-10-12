SP = $(wildcard include/Structures/*.cpp)

FLAGS = -g -Wno-write-strings -Wno-pointer-arith

simplex: Lexer.cpp Parser.cpp Parser.h
	g++ Parser.cpp Lexer.cpp functions.cpp $(SP) $(FLAGS) main.cpp -lfl -o simplex

Parser.cpp Parser.h: parser.y
	bison -d -g -t -r all --report-file=report parser.y

Lexer.cpp: lexer.l Parser.h
	flex lexer.l

clean:
	rm Parser.cpp Parser.h Parser.dot Lexer.cpp Lexer.h report simplex
	rm -rf *~
