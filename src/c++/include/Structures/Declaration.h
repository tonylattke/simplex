#ifndef STRUCTURE_DECLARATION_H
#define STRUCTURE_DECLARATION_H

#include <iostream>
#include <sstream>
#include <list>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "Type.h"
#include "Value.h"

class Declaration{
  public:
    Declaration(Type type, char* id, Value* value);
    char*	getId();
  	Type 	getType();
  	Value* 	getValue();
  private:
  	char*	id;
  	Type 	type;
  	Value* 	value;
};

#endif