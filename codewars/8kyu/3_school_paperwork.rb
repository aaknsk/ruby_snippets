# frozen_string_literal: true

def paperwork(num, mem)
  num.negative? || mem.negative? ? 0 : num * mem
end

# first answer
# def paperwork(n, m)
#   return 0 if n.negative? || m.negative?

#   n * m
# end

p paperwork(0, 3)

# ==========Test case=================
describe 'Fixed Tests' do
  it 'should pass basic tests' do
    Test.assert_equals(paperwork(5, 5), 25, 'Failed at paperwork(5,5)')
    Test.assert_equals(paperwork(5, -5), 0, 'Failed at paperwork(5,-5)')
    Test.assert_equals(paperwork(-5, -5), 0, 'Failed at paperwork(-5,-5)')
    Test.assert_equals(paperwork(-5, 5), 0, 'Failed at paperwork(-5,5)')
    Test.assert_equals(paperwork(5, 0), 0, 'Failed at paperwork(5,0)')
  end
end

describe 'Random Tests' do
  it 'should pass random tests' do
    100.times do
      i = rand(-100..100)
      j = rand(-100..100)
      result = i.positive? && j.positive? ? i * j : 0
      Test.assert_equals(paperwork(i, j), result)
    end
  end
end
