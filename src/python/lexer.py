import sys

# List of tokens
tokens = (
	'TKPROGRAM', 'TKLBRACE', 'TKRBRACE', 'TKSEMICOLON', 'TKHYPHEN', 'TKEQUAL',
	'TKINTVALUE', 'TKSTRVALUE', 'TKID', 'TKINT', 'TKSTR'
	)

# Reserved words
reserved = { 'program': 'TKPROGRAM', 'int': 'TKINT', 'str':'TKSTR' }

# Symbols used
t_TKHYPHEN		= r'-'
t_TKSEMICOLON 	= r';'
t_TKEQUAL  		= r'='
t_TKLBRACE  	= r'{'
t_TKRBRACE  	= r'}'

def t_TKID(t):
	r'[a-zA-Z_][a-zA-Z_0-9_]*'
	t.type = reserved.get(t.value,'TKID')
	return t

def t_TKSTRVALUE(t):
	r'"(?:[^"\\]|\\.)*"'
	t.type = reserved.get(t.value,'TKSTRVALUE')
	return t

def t_TKINTVALUE(t):
    r'\d+'
    t.value = int(t.value)
    return t

# Ignore Spaces, Tabulations and end of lines
t_ignore  = ' \t\n'

# Catch illegal character
def t_error(t):
    print "Illegal character: '%s'" % t.value[0]
    sys.exit(0)
    t.lexer.skip(1)