[1, [2], [[3, 4], 5]] |> List.flatten |> Enum.map(fn x -> x * x * x end)


Enum.map(List.flatten([1, [2], [[3, 4], 5]]), fn x -> x * x * x end)
