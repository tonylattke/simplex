#include "functions.h"

extern AST* tree;
extern int yyparse();

int main(int argc, char *argv[]) {
  FILE *myfile;

  // Read the arguments
  int numArg = 1;
  int cantidad = 10;
	while (numArg < argc){
    if (equal(argv[numArg], (char *) "-h")){
      std::cout << "Syntax:" << std::endl;
      std::cout << "  simplex <name_of_file>" << std::endl;
      return 0;
    } else {
      myfile = fopen(argv[numArg], "r");
    }
    numArg++;
  }

  // Open file
  if (!myfile) {
    std::cout << "Could not open the file" << std::endl;
    return -1;
  }

  // Execute parser
  yyin = myfile;  
  yyparse();

  // Read the AST information
  if (tree != NULL){

    std::cout << "Name of variables:" << std::endl;

    std::list<Declaration*>::iterator iterador = tree->getDeclarations()->begin();
    std::list<Declaration*>::iterator end = tree->getDeclarations()->end();
    
    while (iterador != end){
      std::cout << "\t" << (*iterador)->getId() << std::endl;

      iterador++;
    }

    std::cout << std::endl << "It works!" << std::endl;
  } else{
    std::cout << "Error: AST can not be created" << std::endl;
  }

  return 0;
}
