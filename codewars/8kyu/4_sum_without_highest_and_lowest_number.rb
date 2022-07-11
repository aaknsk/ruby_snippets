# frozen_string_literal: true

numbers = [6, 2, 1, 8, 10]

# 数字以外の値が渡されたら0を返す
# 配列が空もしくは、要素が１つの場合は、0を返す
def sum_array(arr)
  return 0 if arr.nil? || arr.empty? || arr.count == 1

  all_numbers_sum = arr.sum
  (all_numbers_sum - arr.max) - arr.min
end

# other example
# def sum_array(arr)
#   if arr.is_a?(Array) and arr.length > 2
#     arr.inject(:+) - arr.min - arr.max
#   else
#     0
#   end
# end

p sum_array(numbers)

# ==========Test case=================
describe 'Solution' do
  it('nil or Empty') do
    Test.assert_equals(sum_array(nil), 0)
    Test.assert_equals(sum_array([]), 0)
  end
  it('Only one Element') do
    Test.assert_equals(sum_array([3]), 0)
    Test.assert_equals(sum_array([-3]), 0)
  end
  it('Only two Element') do
    Test.assert_equals(sum_array([3, 5]), 0)
    Test.assert_equals(sum_array([-3, -5]), 0)
  end
  it('Real Tests') do
    Test.assert_equals(sum_array([6, 2, 1, 8, 10]), 16)
    Test.assert_equals(sum_array([6, 0, 1, 10, 10]), 17)
    Test.assert_equals(sum_array([-6, -20, -1, -10, -12]), -28)
    Test.assert_equals(sum_array([-6, 20, -1, 10, -12]), 3)
  end

  it 'Random tests' do
    def sol(arr)
      if arr.class != Array || arr.length < 3
        0
      else
        arr.reduce([0, 9_999_999_999_999, -9_999_999_999_999]) do |a, b|
          [a[0] + b, a[1] > b ? b : a[1], a[2] < b ? b : a[2]]
        end.reduce { |a, b| a - b }
      end
    end

    40.times do
      arr = (0..rand(1..45)).map { (-1)**rand(0..1) * rand(1..10**rand(1..3)) }
      Test.assert_equals(sum_array([] + arr), sol(arr.dup), "Testing for #{arr}")
    end
  end
end
