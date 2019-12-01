defmodule Day1 do

  def part1 do
    input_stream()
    |> Stream.map(&calc_fuel/1)
    |> Enum.sum()
  end

  def part2 do
    input_stream()
    |> Stream.map(&calc_deep_fuel/1)
    |> Enum.sum()
  end

  def input_stream() do
    "./data/day1.txt"
    |> File.stream!()
    |> Stream.map(fn text -> Integer.parse(text) |> elem(0) end)
  end

  def calc_fuel(mass) do
    max(0, trunc(mass / 3) - 2)
  end

  def calc_deep_fuel(mass) do
    calc_deep_fuel(mass, 0)
  end

  def calc_deep_fuel(0, total) do
    total
  end

  def calc_deep_fuel(mass, total) do
    new_mass =  calc_fuel(mass)
    calc_deep_fuel(new_mass, total + new_mass)
  end

end
