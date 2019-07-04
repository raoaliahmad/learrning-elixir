#Module attributes

The purpose of module attributes is twofold: they can be used as compile-time constants, and you can register any attribute, which can be then queried in runtime. Let’s look at an example. The following module provides basic functions for working with

circles:
	iex(1)> defmodule Circle do
		@pi 3.14159			Defines a module attribute
		
		def area(r), do: r*r*@pi
		def circumference(r), do: 2*r*@pi
	end


#TYPE SPECIFICATIONS

Type specifications (often called typespecs) are another important feature based on attributes.

defmodule Circle do
	@pi 3.14159
	
	@spec area(number) :: number
	def area(r), do: r*r*@pi
	
	@spec circumference(number) :: number
	def circumference(r), do: 2*r*@pi
end

#Comments

Comments in Elixir start with the character # , which indicates that the rest of the line
is a comment. Block comments aren’t supported. If you need to comment multiple
lines, prefix each one with a # character:

"# This is a comment"

#Atoms

Atoms are literal named constants. They’re similar to symbols in Ruby or enumera-
tions in C/C++. Atom constants start with a colon character, followed by a combina-
tion of alphanumerics and/or underscore characters:

:an_atom
:another_atom

It’s possible to use spaces in the atom name with the following syntax:
:"an atom with spaces"

An atom consists of two parts: the text and the value. The atom text is whatever you put after the colon character. At runtime, this text is kept in the atom table. The value is the data that goes into the variable, and it’s merely a reference to the atom table. This is exactly why atoms are best used for named constants. They’re efficient both memory- and performance-wise.