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