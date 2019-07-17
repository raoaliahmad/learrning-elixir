#=============> MODULES <==================#
# Modules are a collection of functions
# Syntax to define module and a funtion in it is as follows
# i.e using defmodule constructs

defmodule Geometry do
	@moduledoc "Implements sample module for learning"

	@doc "Calculates rectangle area"
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

#==============> Module Attributes <======================
# The purpose of module attributes is twofold: they can be used as compile-time constants, and you can register any attribute, which can be then queried in runtime.

# defmodule Circle do
# 	@pi 3.14159
	
# 	#Defines a module attribute
	
# 	def area(r), do: r*r*@pi
	
# 	def circumference(r), do: 2*r*@pi
# end

# The attributes @moduledoc and @doc can be used to provide
# documentation for modules and functions:

# defmodule Circle do
# 	@moduledoc "Implements basic circle functions"
# 	@pi 3.14159
	
# 	@doc "Computes the area of a circle"
# 	def area(r), do: r*r*@pi
	
# 	@doc "Computes the circumference of a circle"
# 	def circumference(r), do: 2*r*@pi
# end

# To try this, however, you need to generate a compiled file. Here’s a quick way to do it.

# Save this code to the circle.ex file somewhere, and then run 'elixirc circle.ex' . This
# will generate the file 'Elixir.Circle.beam'.

# Next, start iex shell from the same folder. You
# can now retrieve the attribute at runtime:

#=================> Type Specifications <===========================

# Type specifications (often called typespecs) are another important feature based on
# attributes. This feature allows you to provide type information for your functions

defmodule Circle do
	@pi 3.14159
	
	@spec area(number) :: number
	def area(r), do: r*r*@pi
	
	@spec circumference(number) :: number
	def circumference(r), do: 2*r*@pi
end

# The @spec attribute to indicate that both functions accept and return a number
# Typespecs provide a way of compensating for the lack of a static type system. This
# can be useful in conjunction with 'the dialyzer tool' to perform static analysis of your
# programs. Furthermore, typespecs allow you to document your functions better.
# Remember that Elixir is a dynamic language, so function inputs and output can’t be
# easily deduced by looking at the function’s signature. Typespecs can help significantly
# with this

# ============> THE MIX TOOL <==========

# The mix tool is used to manage projects that are made up of multiple source files.
# Whenever you need to build a production-ready system, mix is your best option. To
# create a new mix project, you can call mix new project_name from the command line:

# 	$ mix new my_project

# This creates a new folder named my_project containing a couple of subfolders and
# files. You can change to the my_project folder and compile the entire project:
# 	$ cd my_project
# 	$ mix compile

# 	Compiled lib/my_project.ex
# 	Compiled lib/my_project/supervisor.ex
# 	Generated my_project.app

# The compilation goes through all the files from the lib and places the resulting beam
# files in the ebin folder. You can now start the mix project in multiple ways:


# 	$ mix run   (Starts the system; terminates as soon as MyProject.start finishes)
# 	$ mix run --no-halt  (Starts the system, doesn’t terminate)
# 	$ iex -S mix run (Starts the system and then loads the interactive shell)

# Regardless of how you start the mix project, it ensures that the ebin folder (where the
# beam files are placed) is in the load path so the VM can find your modules.