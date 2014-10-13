{
module Grammar where

import Data.Char (isSpace,isAlpha,isDigit)

import Tokens
import Structures

}

%name parseSimplex
%tokentype { Token }
%error { parseError }

%token
    program  { TKPROGRAM }
    '{'      { TKLBRACE }
    '}'      { TKRBRACE }
    ';'      { TKSEMICOLON }
    '='      { TKEQUAL }
    '-'      { TKHYPHEN }
    str      { TKSTR }
    int      { TKINT }
    string   { TKSTRVALUE $$ }
    integer  { TKINTVALUE $$ }
    id     { TKID $$ }

%%

-- Main rule
Principal : program '{' Declarations '}'  { AST $3 }

-- Declarations rules
Declarations: Declaration                 { [$1] }
            | Declarations Declaration    { $1 ++ [$2] }

Declaration: Type id '=' Value ';'        { Dec $1 $2 (Just $4) }
           | Type id ';'                  { Dec $1 $2 Nothing }

-- Types String and Integer
Type: str                                 { TStr }
    | int                                 { TInt }

-- Values integer or string
Value: integer                            { Int $1 }
    | '-' integer                         { Int (-$2) }
    | string                              { Str $1 }

{

-- Error manager
parseError :: [Token] -> a
parseError _ = error "Parser error"

}