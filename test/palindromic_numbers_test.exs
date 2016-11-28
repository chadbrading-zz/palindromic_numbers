defmodule PalindromicNumbersTest do
  use ExUnit.Case
  doctest PalindromicNumbers

  @file_name Application.get_env(:palindromic_numbers, :file_name)

  test "main" do
    PalindromicNumbers.main(["10"])

    results = File.read(@file_name)
    assert results == {:ok, "decimal, smallest base in which the number is a palindrome\n0, 2\n1, 2\n2, 3\n3, 2\n4, 3\n5, 2\n6, 5\n7, 2\n8, 3\n9, 2\n10, 3\n"}
  end

  test "find_smallest_bases" do
    {:ok, file} = File.open(@file_name, [:write])
    PalindromicNumbers.find_smallest_bases(10, file)

    results = File.read(@file_name)
    assert results == {:ok, "0, 2\n1, 2\n2, 3\n3, 2\n4, 3\n5, 2\n6, 5\n7, 2\n8, 3\n9, 2\n10, 3\n"}
  end

  test "find_smallest_base" do
    assert PalindromicNumbers.find_smallest_base(5) == {"101", 2}
    assert PalindromicNumbers.find_smallest_base(12, 3) == {"22", 5}
    assert PalindromicNumbers.find_smallest_base(47, 2) == {"11", 46}

  end

  test "change_base" do
    assert PalindromicNumbers.change_base(4, 2) == "100"
    assert PalindromicNumbers.change_base(25, 8) == "31"
    assert PalindromicNumbers.change_base(120, 11) == "AA"
  end

  test "convert_number_to_string" do
    assert PalindromicNumbers.convert_number_to_string(5) == "5"
    assert PalindromicNumbers.convert_number_to_string(10) == "A"
    assert PalindromicNumbers.convert_number_to_string(15) == "F"
  end
end
