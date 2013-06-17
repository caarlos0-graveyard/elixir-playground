# Functions that doesn't exist:
# empty?/1
# count/1
# first/1

# List.flatten does exists:
# List.flatten [1, [:a, 3], [[4], :b]]
# returns: [1,:a,3,4,:b]

########################3

# implementing empty?/1 using pattern matching
defmodule MyList do
  # if its an empty list, returns true
  # this is an one-liner style, notice the ", do:"
  def empty?([]), do: true
  # if it is a non-empty list, return false.
  # this is a "complete style", with and do-end
  # block and also a guard (is_list(list)) to
  # make sure that's really a list.
  def empty?(list) when is_list(list) do
    false
  end
end

IO.puts MyList.empty? [1, 2, 3]   # false
IO.puts MyList.empty? []          # true

# due to the guard in our module impl, this will
# give us a function exception, saying that there
# is no function empty? for this type of argument/1
MyList.empty? :you_mad_bro?


########################3

# implementing first/1

defmodule MyList do
  # this uses head/tail pattern matching.
  # the _ in _tail is just for elixir doesn't
  # complain about unused variable.
  def first([ head | _tail ]), do: head
end

IO.puts MyList.first [1]              # 1
IO.puts MyList.first [3, 1, 2, 5, 1]  # 3

########################3

# implementing count/1

defmodule MyList do
  # again, pattern matching
  def count([]), do: 0
  # head tail recursion, looks like the head/tail
  # thing already guard the expression agains
  # different types! KEWL
  # again, head is not used, so, I put a "_"
  # before it =)
  def count([ _head | tail ]) do
    1 + count(tail)
  end
end

IO.puts MyList.count([])              # 0
IO.puts MyList.count([1])             # 1
IO.puts MyList.count([3, 1, 2, 5, 1]) # 5

########################3

# implementing flatten/1 (just for fun)
defmodule MyList do
  # for empty arrays, return just an empty array
  def flatten([]), do: []
  # head tail recursion
  def flatten([ head | tail ]) do
    flatten(head) ++ flatten(tail)
  end
  # I'm not realy sure about this...
  def flatten(head), do: [head]
end

IO.inspect MyList.flatten([ [1], [ 2, [3] ] , [4]]) # [1,2,3,4]
IO.inspect MyList.flatten([ [], [ [], [3] ] , [4]]) # [3,4]

