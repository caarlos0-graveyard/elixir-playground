defmodule MyList do
  def len(xs) do
    len(xs, 0)
  end

  def len([], acc) do
    acc
  end

  def len([_x|xs], acc) do
    len(xs, acc + 1)
  end
end
