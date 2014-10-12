%{
#include <list>
#include "functions.h"

#define YYERROR_VERBOSE 1

int yyerror(const char *s);

AST* tree;
%}

%output  "Parser.cpp"
%defines "Parser.h"

%union {
  int ival;
  char* sval;
  char* nval;

  void* r_p;
  void* r_ds;
  void* r_d;
  int  r_t;
  void* r_a;
}

%token TKPROGRAM TKLBRACE TKRBRACE TKSEMICOLON TKINT TKSTR TKHYPHEN TKEQUAL

%token <ival> TKINTVALUE
%token <sval> TKSTRVALUE
%token <nval> TKID

%type <r_p>  principal
%type <r_ds> declarations
%type <r_d>  declaration
%type <r_t>  type
%type <r_a>  value

%left TKHYPHEN

%%

principal:
  TKPROGRAM TKLBRACE declarations TKRBRACE 
    {
      tree = new AST((std::list<Declaration*>*) $3);
      cout << "Parser complete!" << endl << endl; 
    }
;

declarations:
  declaration
    {
      // Init list of declarations
      std::list<Declaration*>* list_exit = new std::list<Declaration*>();

      // Push element
      list_exit->push_back((Declaration*) $1);
      $$ = (void*) list_exit;
    }
  | declarations declaration
    {
      // Push element
      ((std::list<Declaration*>*) $1)->push_back((Declaration*) $2);
      $$ = $1;
    }
;

declaration:
  type TKID TKEQUAL value TKSEMICOLON
    {
      Declaration* aux = new Declaration((Type) $1, $2, (Value*) $4);
      $$ = (void*) aux; 
    }
  | type TKID TKSEMICOLON
    {
      Declaration* aux = new Declaration((Type) $1, $2, NULL);
      $$ = (void*) aux; 
    }
;

type:
  TKSTR  
    {
      $$ = TYPE_STR;
    }
  | TKINT  
    {
      $$ = TYPE_INT;
    }
;

value:
  TKINTVALUE 
    {
      $$ = (void*) new IntegerValue($1);
    }
  | TKHYPHEN TKINTVALUE 
    {
      $$ = (void*) new IntegerValue(- $2);
    }
  | TKSTRVALUE 
    {
      $$ = (void*) new StringValue($1);
    }
;

%%

int yyerror(const char *s) {
  cout << "Error parser! Message: " << s << endl;
  return -1;
}