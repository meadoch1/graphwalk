defmodule GraphwalkTest do
  use ExUnit.Case
  doctest Graphwalk

  test "find_path handles a successful 2x3 matrix" do
    matrix = [[1,4,5],
              [2,3,6]]
    assert Graphwalk.find_path(matrix) == true
  end
  test "find_path handles a failing 2x3 matrix" do
    matrix = [[1,4,6],
              [2,3,5]]
    assert Graphwalk.find_path(matrix) == false
  end
end
