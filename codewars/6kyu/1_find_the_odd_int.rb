# frozen_string_literal: true

# 一番最初に評価にヒットした値を返す,jsのfindと同じ動作
# 配列に対して、自身をカウントし、カウント結果が奇数のものを返している
def find_it(seq)
  seq.detect { |n| seq.count(n).odd? }
end

# l = [1, 2, 2, 1, 3]
# odd_number = number_count.select { |_key, val| val.odd? }.keys.first
# p odd_number.keys.first
# p odd_number

# ====my first answer
# def find_it(seq)
#   number_count = seq.uniq.map { |item| [item, seq.count(item)] }.to_h
#   number_count.select { |_key, val| val.odd? }.keys.first
# end

# =============other answers=======
# clever one
# def find_it(seq)
#   seq.reduce(:^)
# end

# def find_it(seq)
#   seq.uniq.each do |val|
#     return val if seq.count(val).odd?
#   end
# end

# ==========Test case=================
describe('Basic tests') do
  Test.assert_equals(find_it([20, 1, -1, 2, -2, 3, 3, 5, 5, 1, 2, 4, 20, 4, -1, -2, 5]), 5)
  Test.assert_equals(find_it([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5]), -1)
  Test.assert_equals(find_it([20, 1, 1, 2, 2, 3, 3, 5, 5, 4, 20, 4, 5]), 5)
  Test.assert_equals(find_it([10]), 10)
  Test.assert_equals(find_it([1, 1, 1, 1, 1, 1, 10, 1, 1, 1, 1]), 10)
end

describe('Random tests') do
  def randint(a, b)
    rand(b - a + 1) + a
  end

  40.times do
    s = ->(arr) { (arr + arr + [randint(1, 20)]).shuffle }.call((0..randint(1, 10)).map { randint(1, 20) })
    exp = s.uniq.select { |a| s.count(a).odd? }[0]
    it("Testing for #{s}") do
      Test.assert_equals(find_it(s), exp)
    end
  end
end
