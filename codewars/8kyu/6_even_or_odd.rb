# frozen_string_literal: true

def even_or_odd(number)
  (number % 2).zero? ? 'Even' : 'Odd'
end

# use even? method
# def even_or_odd(number)
#   number.even? ? "Even" : "Odd"
# end

# ==========Test case=================
describe 'Fixed tests' do
  it 'should pass fixed tests' do
    Test.assert_equals(even_or_odd(2), 'Even', 'even_or_odd(2)')
    Test.assert_equals(even_or_odd(1), 'Odd', 'even_or_odd(1)')
    Test.assert_equals(even_or_odd(-1), 'Odd', 'even_or_odd(-1)')
    Test.assert_equals(even_or_odd(0), 'Even')
    Test.assert_equals(even_or_odd(1_545_452), 'Even')
    Test.assert_equals(even_or_odd(7), 'Odd')
    Test.assert_equals(even_or_odd(78), 'Even')
    Test.assert_equals(even_or_odd(17), 'Odd')
    Test.assert_equals(even_or_odd(74_156_741), 'Odd')
    Test.assert_equals(even_or_odd(100_000), 'Even')
    Test.assert_equals(even_or_odd(-123), 'Odd')
    Test.assert_equals(even_or_odd(-456), 'Even')
  end
end

describe 'Random tests' do
  it 'should pass random tests' do
    100.times do
      num = rand(-(10**rand(0..9))..10**rand(0..9))
      expected = num.even? ? 'Even' : 'Odd'
      Test.assert_equals(even_or_odd(num), expected)
    end
  end
end
