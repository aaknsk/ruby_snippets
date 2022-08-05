# frozen_string_literal: true

def array_diff(a, b)
  a_list = a.map { |val| val }
  b.each do |num|
    a_list.delete(num)
  end
  a_list
end

# ＝＝＝＝＝smart answer=======
# array.difference も同じ結果を返す。シンプルに-の方を採用
def array_diff(a, b)
  a - b
end

# ==========Test case=================
describe 'Basic Tests' do
  it 'should pass basic tests' do
    Test.assert_equals(array_diff([1, 2], [1]), [2], 'a was [1,2], b was [1], expected [2]')
    Test.assert_equals(array_diff([1, 2, 2], [1]), [2, 2], 'a was [1,2,2], b was [1], expected [2,2]')
    Test.assert_equals(array_diff([1, 2, 2], [2]), [1], 'a was [1,2,2], b was [2], expected [1]')
    Test.assert_equals(array_diff([1, 2, 2], []), [1, 2, 2], 'a was [1,2,2], b was [], expected [1,2,2]')
    Test.assert_equals(array_diff([], [1, 2]), [], 'a was [], b was [1,2], expected []')
    Test.assert_equals(array_diff([1, 2, 3], [1, 2]), [3], 'a was [1,2,3], b was [1, 2], expected [3]')
  end
end

describe 'Random Tests' do
  it 'should pass random tests' do
    def randint(a, b)
      rand(b - a) + a
    end

    def array_sol(a, b)
      for item in b
        a.delete(item) until a.index(item).nil?
      end
      a
    end

    40.times do
      alen = randint(0, 20)
      blen = randint(0, 20)
      a = []
      b = []
      alen.times do
        a += [randint(0, 40) - 20]
      end
      blen.times do
        b += [randint(0, 40) - 20]
      end
      expected = array_sol(a, b)
      Test.assert_equals(array_diff(a, b), expected)
    end
  end
end
