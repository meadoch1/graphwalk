defmodule Graphwalk do
  def find_path(matrix) do
    {_,_,elements} = matrix
    |> organize_matrix
    Enum.sort(elements)
    |> can_walk?
  end

  defp organize_matrix(matrix) do
    Enum.reduce(matrix, {0,0,[]},
      fn(row, {i,j,accum}) ->
        {_i, _j, accum_with_row} = Enum.reduce(row,{i,j,accum}, fn(element, {i,j, accum}) -> {i, j+1, accum ++ [{element, i, j}]} end)
        {i+1, 0, accum_with_row}
      end)
  end

  defp can_walk?([h|[]]), do: true
  defp can_walk?([{_, i, j}, {_, i2, j2} = next | t]) when i == i2 and j == j2 - 1, do: can_walk?([next] ++ t)
  defp can_walk?([{_, i, j}, {_, i2, j2} = next | t]) when i == i2 and j == j2 + 1, do: can_walk?([next] ++ t)
  defp can_walk?([{_, i, j}, {_, i2, j2} = next | t]) when i == i2 - 1 and j == j2, do: can_walk?([next] ++ t)
  defp can_walk?([{_, i, j}, {_, i2, j2} = next | t]) when i == i2 + 1 and j == j2, do: can_walk?([next] ++ t)
  defp can_walk?(_), do: false
end
