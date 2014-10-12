#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include <cstdio>
#include <iostream>
#include <stdio.h>      /* printf, scanf, NULL */
#include <stdlib.h>     /* malloc, free, rand */
#include <time.h>       /* time */
#include <sstream>
#include <fstream>
#include <string>
#include <list>
#include <climits>      /* max y min int */
#include <cfloat>       /* max y min float */

#include "include/Structures.h"

using namespace std;

extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

int lengthString(char* a);
bool equal(char* a, char* b);

#endif