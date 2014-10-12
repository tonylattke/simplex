#ifndef STRUCTURE_AST_H
#define STRUCTURE_AST_H

#include <iostream>
#include <sstream>
#include <list>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "Declaration.h"

class AST{
  public:
    AST(std::list<Declaration*>* declarations);
    std::list<Declaration*>* getDeclarations();
  private: 
  	std::list<Declaration*>* declarations;
};

#endif