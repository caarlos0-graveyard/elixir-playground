defmodule Msg do
  def msg do
    receive do
      {:english, name} ->
        IO.puts "Hello, #{name}."
        msg
      {:chinese, name} ->
        IO.puts "你好, #{name}."
        msg
      {:spanish, name} ->
        IO.puts "¡Hola!, #{name}."
        msg
      :exit ->
        IO.puts "Bye bye!"
      _ ->
        IO.puts "I don't understand ... but Hello anyway!"
        msg
    end
  end
end
msg = spawn(Msg, :msg, [])
msg <- {:english, 'Carlos'}
