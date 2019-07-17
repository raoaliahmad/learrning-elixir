
#============> TYPES <==========================

defmodule Syntax.Types do

	@tuple {2,3,5}
	def sum(a, b) do
		a + b
	end

	def showTuple do
		IO.inspect(@tuple)
	end

	def addToTuple (n) do
		new_tuple = put_elem(@tuple,1,n)
		IO.inspect(new_tuple)
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
# Atoms are literal named constants. They’re similar to symbols in Ruby or enumera-
# tions in C/C++. Atom constants start with a colon character, followed by a combina-
# tion of alphanumerics and/or underscore characters:
# 	:an_atom
# 	:another_atom

# An atom consists of two parts: the text and the value. The atom text is whatever you put
# after the colon character. At runtime, this text is kept in the atom table. The value is the
# data that goes into the variable, and it’s merely a reference to the atom table

# This is exactly why atoms are best used for named constants. They’re efficient both
# memory- and performance-wise. When you say
# 	variable = :some_atom
# the variable doesn’t contain the entire text, but only a reference to the atom table.
# Therefore, memory consumption is low, the comparisons are fast, and the code is still
# readable.

# The term boolean is still used in Elixir to denote an atom that has a value of either
# :true or :false . The standard logical operators work with boolean atoms:
# 	iex(1)> true and false
# 	false
# 	iex(2)> false or true
# 	true
# 	iex(3)> not false
# 	true
# 	iex(4)> not :an_atom_other_than_true_or_false
# 	** (ArgumentError) argument error
# Always keep in mind that a boolean is just an atom that has a value of true or false.

# ===> NIL AND TRUTHY VALUES <===
# Another special atom is :nil , which works somewhat similarly to null from other lan-
# guages. You can reference nil without a colon:
# 	iex(1)> nil == :nil
# 	true

#====> TUPLES <=====
# Tuples are something like untyped structures, or records, and they’re most often used
# to group a fixed number of elements together. The following snippet defines a tuple
# consisting of person’s name and age:
# 	iex(1)> person = {"Bob", 25}
# 	{"Bob", 25}

# To extract an element from the tuple, you can use the Kernel.elem/2 function, which
# accepts a tuple and the zero-based index of the element. Recall that the Kernel mod-
# ule is auto-imported, so you can call elem instead of Kernel.elem :

# 	iex(2)> age = elem(person, 1)
# 	25

# To modify an element of the tuple, you can use the Kernel.put_elem/3 function,
# which accepts a tuple, a zero-based index, and the new value of the field in the given
# position
# data in Elixir is immutable, and you can’t do an in-
# memory modification of a value

# 	iex(5)> older_person = put_elem(person, 1, 26)
# 	{"Bob", 26}

# Recall that variables can be rebound, so you can also do the following:
# 	iex(7)> person = put_elem(person, 1, 26)
# 	{"Bob", 26}

#====> Lists <======
# Lists in Erlang are used to manage dynamic, variable-sized collections of data. The syn-
# tax deceptively resembles arrays from other languages:
# 	iex(1)> prime_numbers = [1, 2, 3, 5, 7]
# 	[1, 2, 3, 5, 7]
# Lists may look like arrays, but they work like singly linked lists. To do something with
# the list, you have to traverse it. Therefore, most of the operations on lists have an
# O(n) complexity, including the Kernel.length/1 function, which iterates through
# the entire list to calculate its length:

# To get an element of a list, you can use the Enum.at/2 function:
# 	iex(3)> Enum.at(prime_numbers, 4)
# 	7
# You can check whether a list contains a particular element with the help of the in
# operator:
# 	iex(4)> 5 in prime_numbers
# 	true
# 	iex(5)> 4 in prime_numbers
# 	false

# To manipulate lists, you can use functions from the List module. For example,
# List.replace_at/3 modifies the element at a certain position:
# 	iex(6)> List.replace_at(prime_numbers, 0, 11)
# 	[11, 2, 3, 5, 7]
# As was the case with tuples, the modifier doesn’t mutate the variable, but returns the
# modified version of it, which you need to store to another variable:
# 	iex(7)> new_primes = List.replace_at(prime_numbers, 0, 11)
# 	[11, 2, 3, 5, 7]
# Or you can rebind to the same one:
# 	iex(8)> prime_numbers = List.replace_at(prime_numbers, 0, 11)
# 	[11, 2, 3, 5, 7]
# You can insert a new element at the specified position with the List.insert_at
# function:
# 	iex(9)> List.insert_at(prime_numbers, 4, 1)
# 	[11, 2, 3, 5, 1, 7]
# Inserts a new element
# at the fifth position.
# To append to the end, you can use a negative value for the insert position 
# 	iex(10)> List.insert_at(prime_numbers, -1, 1) (Value of -1 indicates that the element should be appended to the end of the list)
# 	[11, 2, 3, 5, 7, 1]

# Like most list operations, modifying a random element has a complexity of O(n).

# More on Lists recursive behaviour on Pg#39 

#=========> MAPS <==========
# A map is a key-value store, where keys and values can be any term.
# Maps are appropriate when you want
# to combine a couple of fields into a single structure. This use case somewhat overlaps
# that of tuples, but it provides the advantage of allowing you to access fields by name.

# 	iex(1)> bob = %{:name => "Bob", :age => 25, :works_at => "Initech"}
# 	%{age: 25, name: "Bob", works_at: "Initech"}

# If keys are atoms, you can write this so it’s slightly shorter:
# 	iex(2)> bob = %{name: "Bob", age: 25, works_at: "Initech"}
# 	%{age: 25, name: "Bob", works_at: "Initech"}

# To retrieve a field, you can use the access operator [] :
# 	iex(3)> bob[:works_at]
# 	"Initech"
# 	iex(4)> bob[:non_existent_field]
# 	nil

# 	iex(5)> bob.age
# 	25
# But with this syntax, you’ll get an error if you try to fetch the nonexistent field:
# 	iex(6)> bob.non_existent_field
# 	** (KeyError) key :non_existent_field not found
# To change a field value, you can use the following syntax:
# 	iex(7)> next_years_bob = %{bob | age: 26}
# 	%{age: 26, name: "Bob", works_at: "Initech"}
# This syntax can be used to change multiple attributes as well:
# 	iex(8)> %{bob | age: 26, works_at: "Initrode"}
# 	%{age: 26, name: "Bob", works_at: "Initrode"}
# But you can only modify values that already exist in the map. This constraint makes it
# possible to optimize the map update. By knowing that the map structure doesn’t
# change, the fields list can be reused between both versions. Consequently, you use less
# memory, and the update operation is faster.
# To insert a new key-value pair (or modify the existing one), you can use the Map.put/3 function:
# 	iex(9)> Map.put(bob, :salary, 50000)
# 	%{age: 25, name: "Bob", salary: 50000, works_at: "Initech"}
# 
#In addition, a more general-purpose Dict module (http://elixir-lang.org/docs/
# stable/elixir/Dict.html) is provided. This module can be used to manipulate any
# abstract key-value structure such as a HashDict or a keyword list (both presented a bit
# later in this chapter).
# For example, using Dict.put/3 , you can also modify the map:
# 	iex(10)> Dict.put(bob, :salary, 50000)
# 	%{age: 25, name: "Bob", salary: 50000, works_at: "Initech"}
# Using Dict has a benefit of shielding you from possible structural change. You can
# later switch to some other key-value structure without changing the code that manipu-
# lates it. On the flip side, Dict operations are somewhat slower than direct calls to the
# Map module.

#====> STRINGS <======

#-> Bnary Strings
# 	iex(1)> "This is a string"
# 	"This is a string"
# The result is printed as a string, but underneath, it’s a binary—nothing more than a
# consecutive sequence of bytes.
# You can use #{} to place an Elixir expression in a string constant.
# 	iex(2)> "Embedded expression: #{3 + 0.14}"
# 	"Embedded expression: 3.14"

# Classical \ escaping works as you’re used to:
# 	iex(3)> "\r \n \" \\"

# And strings don’t have to finish on the same line:
# 	iex(4)> "
# 	This is
# 	a multiline string

#--> Sijils

# Elixir provides another syntax for declaring strings, so-called sigils. In this approach,
# you enclose the string inside ~s()

# Sigils can be useful if you want to include quotes in a string:
# 	iex(6)> ~s("Do... or do not. There is no try." -Master Yoda)
# 	"\"Do... or do not. There is no try.\" -Master Yoda"
# There is also an uppercase version ~S that doesn’t handle interpolation or escape
# characters ( \ ):
# 	iex(7)> ~S(Not interpolated #{3 + 0.14})
# 	"Not interpolated \#{3 + 0.14}"
# 	iex(8)> ~S(Not escaped \n)
# 	"Not escaped \\n"

# Finally, there is a special heredocs syntax, which supports better formatting for multiline
# strings. Heredocs strings start with a triple double-quote. The ending triple double-
# quote must be on its own line:
# 	iex(9)> """
# 	Heredoc must end on its own line """
# 	"""
# 	"Heredoc must end on its own line \"\"\"\n"
# Because strings are binaries, you can concatenate them with the <> operator:
# 	iex(10)> "String" <> " " <> "concatenation"
# 	"String concatenation"

#-> Character Lists
# The alternative way of representing strings is to use single-quote syntax:
# 	iex(1)> 'ABC'
# 	'ABC'
# This creates a character list, which is essentially a list of integers in which each element
# represents a single character.
# The previous result is exactly the same as if you manually construct the list of
# integers:
# 	iex(2)> [65, 66, 67]
# 	'ABC'
# As you can see, even the runtime doesn’t distinguish between a list of integers and a
# character list. When a list consists of integers that represent printable characters, it’s
# printed to the screen in the string form.
# Just like with binary strings, there are syntax counterparts for various definitions of
# character lists:
# 	iex(3)> 'Interpolation: #{3 + 0.14}'
# 	'Interpolation: 3.14'
# 	iex(4)> ~c(Character list sigil)
# 	'Character list sigil'
# 	iex(5)> ~C(Unescaped sigil #{3 + 0.14})
# 	'Unescaped sigil \#{3 + 0.14}'
# 	iex(6)> '''
# 	Heredoc
# 	'''
# 	'Heredoc\n'
# Character lists aren’t compatible with binary strings. Most of the operations from the
# String module won’t work with character lists. In general, you should prefer binary
# strings over character lists. Occasionally, some functions may work only with character
# lists. This mostly happens with pure Erlang libraries. In this case, you can convert a
# binary string to a character list version using the String.to_char_list/1 function:
# 	iex(7)> String.to_char_list("ABC")
# 	'ABC'
# To convert a character list to a binary string, you can use List.to_string/1 .
# In general, you should prefer binary strings as much as possible.

