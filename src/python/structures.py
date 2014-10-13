from enum import Enum

# Abstract syntax tree
class AST:
	def __init__(self, a):
		self.declarations = a

# Declaration
class Declaration:
	def __init__(self, a,b,c):
		self.type  = a
		self.id    = b
		self.value = c

# Type
class Type(Enum):
	Str = 1
	Int = 2

# Values
class Value:
	def __init__(self):
		self.type  = None

class IntegerValue(Value):
	def __init__(self, a):
		self.value= a
		self.type = Type.Int

class StringValue(Value):
	def __init__(self, a):
		self.value= a
		self.type = Type.Str