%{
#include <iostream>
#include "Parser.h"
using namespace std;
#define YY_DECL extern "C" int yylex()
#define YYLLOC_DEFAULT
%}

%option outfile="Lexer.cpp" header-file="Lexer.h"

%%
[ \t\n]                                                 ;
program                                                 { return TKPROGRAM; }
\{                                                      { return TKLBRACE; }
\}                                                      { return TKRBRACE; }
\;                                                      { return TKSEMICOLON; }
\=                                                      { return TKEQUAL; }
int                                                     { return TKINT; }
str                                                     { return TKSTR; }
\-                                                      { return TKHYPHEN; }
[a-zñá-úä-üA-ZÑÁ-ÚÄ-Ü\_][a-zñá-úä-üA-ZÑÁ-ÚÄ-Ü0-9\_]*    { yylval.nval = strdup(yytext); return TKID; }

0|[1-9][0-9]*                                           { yylval.ival = atoi(yytext); return TKINTVALUE; }
\"[a-zA-Z0-9\_]*\"                                      { int auxTam = 0;
                                                          while (yytext[auxTam] != NULL){
                                                            auxTam++;
                                                          }
                                                          char* auxCh = (char*) malloc((auxTam-2) * sizeof(char));
                                                          int i = 1;
                                                          while (i < auxTam -1){
                                                            auxCh[i-1] = yytext[i];
                                                            i++;
                                                          }
                                                          yylval.sval = strdup(auxCh);
                                                          return TKSTRVALUE;
                                                        }
%%