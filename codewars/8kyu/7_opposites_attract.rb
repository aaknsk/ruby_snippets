# frozen_string_literal: true

def lovefunc(flower1, flower2)
  (flower1 + flower2).odd?
end

# ====first answer
# 登場する数の関係性を考慮し、どうするのが適切か考えること！
# def lovefunc(flower1, flower2)
#   return false if flower1.even? && flower2.even?
#   return false if flower1.odd? && flower2.odd?

#   true
# end

# ==========Test case=================
describe 'Basic Tests' do
  it 'should pass basic tests' do
    Test.assert_equals(lovefunc(1, 4), true)
    Test.assert_equals(lovefunc(2, 2), false)
    Test.assert_equals(lovefunc(0, 1), true)
    Test.assert_equals(lovefunc(0, 0), false)
    Test.assert_equals(lovefunc(5, 5), false)
  end
end

describe 'Random Tests' do
  it 'should work for random tests' do
    50.times do
      flower1 = rand(100)
      flower2 = rand(100)
      expected = flower1.odd? != flower2.odd?
      Test.assert_equals(lovefunc(flower1, flower2), expected)
    end
  end
end
