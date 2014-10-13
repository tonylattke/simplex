from lexer import *
from structures import *

# Main rule
def p_program(p):
	'program : TKPROGRAM TKLBRACE declarations TKRBRACE'
	p[0] = AST(p[3])
	print "Parser complete!"

# Declarations rules
def p_declarations_base(p):
	'declarations : declaration'
	p[0] = [p[1]]

def p_declarations_rec(p):
	'declarations : declarations declaration'
	p[1].append(p[2])
	p[0] = p[1]

def p_declaration_instanced(p):
	'declaration : type TKID TKEQUAL value TKSEMICOLON'
	p[0] = Declaration(p[1],p[2],p[4])

def p_declaration_declared(p):
	'declaration : type TKID TKSEMICOLON'
	p[0] = Declaration(p[1],p[2],None)

# Types String and Integer
def p_type_str(p):
	'type : TKSTR'
	p[0] = Type.Str

def p_type_int(p):
	'type : TKINT'
	p[0] = Type.Int

# Values integer or string
def p_value_int(p):
	'value : TKINTVALUE'
	p[0] = IntegerValue(p[1])

def p_value_nint(p):
	'value : TKHYPHEN TKINTVALUE'
	p[0] = IntegerValue(-p[2])

def p_value_str(p):
	'value : TKSTRVALUE'
	p[0] = StringValue(p[1])

# Error manager
def p_error(p):
	print '\nSyntax error:\n'
	print p