defmodule PalindromicNumbers do
  @file_name Application.get_env(:palindromic_numbers, :file_name)

  def main([n]) do
    {:ok, file} = File.open(@file_name, [:write])
    IO.binwrite(file, "decimal, smallest base in which the number is a palindrome\n")
    find_smallest_bases(String.to_integer(n), file)
  end

  def main(_) do
    IO.inspect "You must give an integer as an argument."
  end

  def find_smallest_bases(n, file) do
    0..n
    |> Enum.each(fn number ->
      {_palindrome, base} = find_smallest_base(number)
      IO.binwrite(file, "#{number}, #{base}\n")
    end)
  end

  def find_smallest_base(number0, base \\ 2) do
    number1 = change_base(number0, base)
      if number1 == String.reverse(number1) do
        {number1, base}
      else
        find_smallest_base(number0, base + 1)
    end
  end

  def change_base(n, base) do
    change_base(div(n, base), base, convert_number_to_string(rem(n, base)))
  end

  def change_base(0, _base, acc) do
    acc
  end

  def change_base(n, base, acc) do
    change_base(div(n, base), base, convert_number_to_string(rem(n, base)) <> acc)
  end

  def convert_number_to_string(n) when n < 10 do
      Integer.to_string(n)
  end

  def convert_number_to_string(n) do
    <<(n-10) + 65>>
  end
end
