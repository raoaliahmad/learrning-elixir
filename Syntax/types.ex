
#============> TYPES <==========================

defmodule Syntax.Types do
	def sum(a, b) do
		a + b
	end 
end

#==> NUMBERS <==
# Numbers can be integers or floats, and they work mostly as you would expect:
# 	iex(1)> 3 Integer
# 	3
# 	iex(2)> 0xFF Integer written in hex
# 	255 
# 	iex(3)> 3.14 Float
# 	3.14 
# 	iex(4)> 1.0e-2 Float, exponential notation
# 	0.01
# Standard arithmetic operators are supported:
# 	iex(5)> 1 + 2 * 3
# 	7
# The division operator / works differently than you might expect. It always returns a float value:
# 	iex(6)> 4/2
# 	2.0
# 	iex(7)> 3/2
# 	1.5
# To perform integer division or to calculate the remainder, you can use auto-imported Kernel functions:
# 	iex(8)> div(5,2)
# 	2
# 	iex(9)> rem(5,2)
# 	1
# As added syntactic sugar, you can use the underscore character as a visual delimiter:
# 	iex(10)> 1_000_000
# 	1000000
# There is no upper limit on the integer size, and you can use arbitrarily large numbers:

#==> ATOMS <==

