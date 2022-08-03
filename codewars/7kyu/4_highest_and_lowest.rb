# frozen_string_literal: true

# reduceの引数の:*は、ブロックに渡された数をそれぞれ乗算する。加算の場合は、:+。めっちゃすっきり
def factorial(n)
  n < 0 ? nil : (1..n).reduce(:*) || 1
end

# ========first answer
def high_and_low(numbers)
  number_arr = numbers.split(' ').map(&:to_i)
  "#{number_arr.max} #{number_arr.min}"
end

# =======smart answer

def high_and_low(numbers)
  numbers.split.map(&:to_i).minmax.reverse.join(' ')
end

# ==========Test case=================
describe 'Fixed Tests' do
  it 'Some Test' do
    Test.assert_equals(high_and_low('4 5 29 54 4 0 -214 542 -64 1 -3 6 -6'), '542 -214')
  end
  it 'Sort Test' do
    Test.assert_equals(high_and_low('10 2 -1 -20'), '10 -20')
  end
  it 'Plus Minus Test' do
    Test.assert_equals(high_and_low('1 -1'), '1 -1')
  end
  it 'Plus Plus Test' do
    Test.assert_equals(high_and_low('1 1'), '1 1')
  end
  it 'Minus Minus Test' do
    Test.assert_equals(high_and_low('-1 -1'), '-1 -1')
  end
  it 'Plus Minus Zero Test' do
    Test.assert_equals(high_and_low('1 -1 0'), '1 -1')
  end
  it 'Plus Plus Zero Test' do
    Test.assert_equals(high_and_low('1 1 0'), '1 0')
  end
  it 'Minus Minus Zero Test' do
    Test.assert_equals(high_and_low('-1 -1 0'), '0 -1')
  end
  it 'Single Test' do
    Test.assert_equals(high_and_low('42'), '42 42')
  end
  it 'Zero Minus Test' do
    Test.assert_equals(high_and_low('0 -1'), '0 -1')
  end
  it 'Zero Zero Test' do
    Test.assert_equals(high_and_low('0 0'), '0 0')
  end
end

describe 'Random Tests' do
  it 'Random Tests' do
    40.times do
      arg = Array.new(15) { rand(-999...999) }
      exp = "#{arg.max} #{arg.min}"
      arg = arg.join(' ')
      Test.assert_equals(high_and_low(arg), exp, "Test for #{arg.inspect}")
    end
  end
end
