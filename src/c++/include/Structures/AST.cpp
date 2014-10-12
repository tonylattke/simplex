#include "AST.h"

AST::AST(std::list<Declaration*>* a){
	declarations = a;
}

std::list<Declaration*>* AST::getDeclarations(){
	return declarations;
}