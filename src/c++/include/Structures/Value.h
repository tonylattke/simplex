#ifndef STRUCTURE_VALUE_H
#define STRUCTURE_VALUE_H

#include <iostream>
#include <sstream>
#include <list>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "Type.h"

class Value {
  public:
    Value();
    Type getType();
    Type type;
};

class IntegerValue: public Value {
  public:
    IntegerValue(int value);
    int getValue();
  private:
  	int value;
};

class StringValue: public Value {
  public:
    StringValue(char* value);
    char* getValue();
  private:
  	char* value;
};

#endif