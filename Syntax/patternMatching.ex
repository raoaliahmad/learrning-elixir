# =====> MULTICLAUSE FUNCTIONS <=======

# Elixir allows you to overload a function by specifying multiple clauses. 
# A clause is a function definition specified by the def construct.
# If you provide multiple definitions of the same function with the same arity, it’s said that the function has multiple clauses.

defmodule GeometryPM do
	def area({:rectangle, a, b}) do
		a * b
	end

	def area({:square, a}) do 
		a * a
	end

	def area({:circle, r}) do 
		r * r
	end
	
	def area(unknown) do 
		{:error, {:unknown_shape, unknown}}	
	end
end

# it’s important to place the clauses in the
# appropriate order. The runtime tries to select the clauses using the order in
# the source code. If the area(unknown) clause was defined first, you would
# always get the error result

# ======> GUARDS <=========

# Guards are an extension of the basic pattern-matching mechanism. They allow you
# to state additional broader expectations that must be satisfied for the entire pattern to
# match.
# A guard can be specified by providing the when clause after the arguments list. This
# is best illustrated by example

defmodule TestNum do
	def test(x) when x < 0 do
		:negative
	end
	
	def test(0), do: :zero
	
	def test(x) when x > 0 do
		:positive
	end
end

# Elixir Elixir terms can be compared with the operators < and > , even if they’re not of the same type
# In this case, the type ordering determines the result:
# number < atom < reference < fun < port < pid <
# tuple < map < list < bitstring (binary)

# So it we do
#	def test(x) when is_number(x) and x > 0 do
#		:positive
#	end

# To see allowed operators and functions look pg#77

#=====> MULTICLAUSE LAMDAS <=========

defmodule TestNum.Two do 
	
	def tester(x) do
		temp = fn 
			x when is_number(x) and x < 0 ->
				:negative
			0 -> :zero
			x when is_number(x) and x > 0 ->
				:positive
		end
		temp.(x)
	end
end