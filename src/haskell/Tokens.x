{
module Tokens where
}

%wrapper "basic"

$digits = 0-9
$alpha = [a-zA-Z]

tokens :-
  program                         { \s -> TKPROGRAM }
  \{                              { \s -> TKLBRACE }
  \}                              { \s -> TKRBRACE }
  \;                              { \s -> TKSEMICOLON }
  \=                              { \s -> TKEQUAL }
  \-                              { \s -> TKHYPHEN }
  str                             { \s -> TKSTR }
  int                             { \s -> TKINT }
  $digits+                        { \s -> TKINTVALUE (read s) }
  \" [^\"]* \"                    { \s -> TKSTRVALUE s }
  $alpha [$alpha $digits \_]*     { \s -> TKID s }
  $white+                         ;
  .                               ;

{
-- List of tokens
data Token = TKPROGRAM 
          | TKLBRACE
          | TKRBRACE
          | TKSEMICOLON
          | TKHYPHEN
          | TKEQUAL
          | TKINTVALUE Int
          | TKSTRVALUE String
          | TKINT
          | TKSTR
          | TKID String
           deriving (Eq,Show)

scanTokens = alexScanTokens
}