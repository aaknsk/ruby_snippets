# frozen_string_literal: true

def solution(number)
  (1...number).select { |i| i % 3 == 0 || i % 5 == 0 }.inject(:+)
end

# ＝＝＝＝＝smart answer=======
def solution(number)
  (1...number).select { |n| (n % 5).zero? || (n % 3).zero? }.reduce(:+)
end
# ==========Test case=================
describe('solution') do
  def _solution(number)
    (1..(number - 1)).inject(0) do |sum, n|
      sum + (n % 3 == 0 || n % 5 == 0 ? n : 0)
    end
  end

  def test(n, expected)
    expect(solution(n)).to eq(expected), "Expected #{expected}, got #{solution(n)}"
  end

  it('basic tests') do
    test(10, 23)
    test(20, 78)
    test(200, 9168)
  end

  it('random cases') do
    (1..10).each do |_|
      n = rand(-100..1000)
      test(n, _solution(n))
    end
  end
end
