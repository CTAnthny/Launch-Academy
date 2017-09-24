require "simplecov"
SimpleCov.start
require "pry"
require "spec_helper"
require_relative "../code"

describe "perimeter" do
  it "returns 16 for a square with a width of 4" do
    expect(perimeter(4)).to eq(16)
  end

  it "returns 24 for a rectangle with a width of 4 and a length of 8" do
    expect(perimeter(4, 8)).to eq(24)
  end
end

describe "average" do
  it "returns 80.5 for a grade_list [87, 82, 63, 90]" do
    expect(average([87, 82, 63, 90])).to eq(80.5)
  end
end

describe "rankings" do
  it "returns a string of student rankings for student list ['john', 'sally', 'bill', 'jane']" do
    students = ["john", "sally", "bill", "jane"]
    expect(rankings(students)).to eq("1. john\n2. sally\n3. bill\n4. jane\n")
  end
end

describe "greet" do
  it "returns inputted name with 'Hola' for 'spanish' language argument" do
    expect(greet('Chris', 'spanish')). to eq("Hola Chris!")
  end

  it "returns inputted name with 'Ciao' for 'italian' language argument" do
    expect(greet('Chris', 'italian')). to eq("Ciao Chris!")
  end

  it "returns inputted name with 'Bonjour' for 'french' language argument" do
    expect(greet('Chris', 'french')). to eq("Bonjour Chris!")
  end

  it "returns inputted name with 'Hi' for no supplied language argument" do
    expect(greet('Chris')). to eq("Hi Chris!")
  end
end

describe "print_puzzle" do
  it "prints the first 2 correctly guessed letters of the word" do
    expect(print_puzzle('cat', ['c', 'a', 'r'])).to eq('c a _')
  end

  it "prints 3 blank lines when there are no guesses" do
    expect(print_puzzle('car', [])). to eq('_ _ _')
  end
end

describe "divisible_by_three?" do
  it "returns true for a number divisble by three" do
    expect(divisible_by_three?(9)).to eq(true)
  end

  it "returns false for a number not divisble by three" do
    expect(divisible_by_three?(8)).to eq(false)
  end
end

describe "perfect_square?" do
  it "returns an error for a number less than one" do
    expect{ perfect_square?(0.5) }.to raise_error(ArgumentError, "number must be greater than or equal to one")
  end

  it "returns true for a number perfectly squared" do
    expect(perfect_square?(4)).to eq(true)
  end

  it "returns false for a number imperfectly squared" do
    expect(perfect_square?(2)).to eq(false)
  end
end
