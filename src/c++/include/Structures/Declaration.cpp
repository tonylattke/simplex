#include "Declaration.h"

Declaration::Declaration(Type a, char* b, Value* c){
	type = a;
	id 	= b;
	value = c;
}

char* Declaration::getId(){
	return id;
}

Type Declaration::getType(){
	return type;
}

Value* Declaration::getValue(){
	return value;
}