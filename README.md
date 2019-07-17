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

#Pattern Matching

The pattern-matching expression consists of two parts: the pattern (left side) and
the term (right side). In a match expression, the attempt to match the term to the pat-
tern takes place.

If the match succeeds, all variables in the pattern are bound to the corresponding
values from the term. The result of the entire expression is the entire term you
matched. If the match fails, an error is raised.
Therefore, in a pattern-matching expression, you perform two different tasks:


1) You assert your expectations about the right-side term. If these expectations
aren’t met, an error is raised.
2) You bind some parts of the term to variables from the pattern.

The match operator = is just one example where pattern matching can be used. Pat-
tern matching powers many other kinds of expressions, and it’s especially powerful
when used in functions.