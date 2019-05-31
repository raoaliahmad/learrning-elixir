#================> FUNCTIONS <======================#

# Must always be a part of module

#page 24 section 2.3.2 Sasa Juric - Elixir in Action

#module attributes 2.3.6 **Important**

defmodule MyModule do
	#Imports the module
	import IO

	def my_function do
		puts "Calling imported function."
	end
end