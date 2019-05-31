#=============> MODULES <==================#
# Modules are a collection of functions
# Syntax to define module and a funtion in it is as follows
# i.e using defmodule constructs

defmodule Geometry do
	def rectangle_area(a,b) do
		a * b
	end
end

# To access a module's function use
# ModuleName.function_name(args)
# In the source code, a module must be defined in a single file. A single file may contain
# multiple module definitions
# A module name should strat with an uppercase letter and is usually written in camel case letters

# A module name can consist of alphanumerics, under-scores, and the dot ( . ) character.
# The latter is often used to organize modules hierarchically e.g.
#
#	defmodule Geometry.Rectangle do
#		...
#	end
#	
#	defmodule Geometry.Circle do
#		...
#	end

#Modules can also be nested
#
# 	defmodule Geometry do
#		defmodule Rectangle do
#			...
#		end
#	end

# The child module can be referenced with Geometry.Rectangle . Again, this nesting is
# a convenience. After the compilation, there is no special relation between the mod-ules 
# Geometry and Geometry.Rectangle .