#================> FUNCTIONS <======================#
# Load module to shell to run "iex functions.ex"
# Must always be a part of module

# Page 24 section 2.3.2 Sasa Juric - Elixir in Action

# Module attributes 2.3.6 **Important**

# Function with different arities but same name are two differnt functions in elixir

defmodule MyModule do
	#Imports the module
	import IO

	def my_function do
		puts "Calling imported function."
	end

	def double(a, b) do
		sum(a, b)
	end
	
	defp sum(a, b \\ 0) do  #default values generate multiple functions of the same name
		a + b
	end

	#Functions as first class citizens
	def p_to_args (list) do

		put_elem = fn(x) -> IO.inspect(x) end #creating anonyous funtion or lambda

		# Passing it as an argument
		Enum.each(
			list, 
			put_elem  
		)

		#Can also do this
		# Enum.each(
		# 	[1, 2, 3],
		# 	fn(x) -> IO.puts(x) end
		# ) AND
		#
		# Enum.each(
		# 	[1, 2, 3],
		# 	&IO.puts/1
		# )
	end

end

# Function defined using 'def' are public and can be called by anyone

# Function defined using 'defp' are private and can only be used inside its module

# Importing a module allows you to call its public functions without prefixing them with the module
# name:
# 	defmodule MyModule do
# 		import IO
		
# 		#Imports the module
		
# 		def my_function do
# 			puts "Calling imported function."
# 		end
# 	end

# you can import multiple modules

# An alternative to import is alias , a construct that makes it possible to reference a
# module under a different name:

# defmodule MyModule do
# 	alias IO, as: MyIO
# 	#Creates an alias for IO
	
# 	def my_function do
# 		MyIO.puts("Calling imported function.")
# 	end
# end
# Calls a function using the alias
# Aliases can be useful if a module has a long name

# ============> FIRST CLASS FUNCTIONS <===================

# In Elixir, a function is a first-class citizen, which means it can be assigned to a variable.
# Here, assigning a function to a variable doesn’t mean calling the function and storing
# its result to a variable. Instead, the function definition itself is assigned, and you can
# use the variable to call the function.
# Let’s look at some examples. To create a function variable, you can use the fn
# construct:

# 	iex(1)> square = fn(x) ->
# 		x * x
# 		end

# The variable square now contains a function that computes the square of a number.
# Because the function isn’t bound to a global name, it’s also called an anonymous func-
# tion or a lambda.

# You can call this function by specifying the variable name followed by a dot ( . ) and
# the arguments:
# 	iex(2)> square.(5)
# 	25

# The & operator, also known as the capture operator, takes the full function quali-
# fier—a module name, a function name, and an arity—and turns that function into a
# lambda that can be assigned to a variable. You can use the capture operator to simplify
# the call to Enum.each :
	
# 	iex(6)> Enum.each(
# 		[1, 2, 3],
# 		&IO.puts/1
# 	)

# 	iex(7)> lambda = fn(x, y, z) -> x * y + z end
# 	iex(8)> lambda = &(&1 * &2 + &3)
# 	iex(9)> lambda.(2, 3, 4)
# 	10

# ======> CLOSURES <=============

# A lambda can reference any variable from the outside scope:
# 	iex(1)> outside_var = 5
# 	5
# 	iex(2)> my_lambda = fn() ->
# 		IO.puts(outside_var)
# 	end
# 	iex(3)> my_lambda.()
# 	5
# As long as you hold the reference to my_lambda , the variable outside_var is also
# accessible. This is also known as closure: by holding a reference to a lambda, you indi-
# rectly hold a reference to all variables it uses, even if those variables are from the
# external scope.

# A closure always captures a specific memory location. Rebinding a variable doesn’t
# affect the previously defined lambda that references the same symbolic name:
# 	iex(1)> outside_var = 5
# 	iex(2)> lambda = fn() -> IO.puts(outside_var) end
# 	iex(3)> outside_var = 6
# 	iex(4)> lambda.()
# 	5