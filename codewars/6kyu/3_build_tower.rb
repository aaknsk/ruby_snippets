# frozen_string_literal: true

# STEPS
# 一段増えるごとに、*は２増える
# 一段増えるごとに、上段のスペースは、2増える

# 配列に文字列を代入する n回分
def tower_builder(n_floors)
  tower = []
  element_quantity = 1
  (1..n_floors).each do |n|
    if n == 1
      element_quantity = 1
    else
      element_quantity += 2
    end
    tower << '*' * element_quantity
  end
  tower.map do |str|
    str.center(element_quantity)
  end
end

p tower_builder(5)

# ======Clever Answer
def towerBuilder(n)
  (1..n).map do |i|
    space = ' ' * (n - i)
    stars = '*' * (i * 2 - 1)
    space + stars + space
  end
end

# ＝＝＝＝＝smart answer=======

s = '1234567890'
n = 3
s.scan(/.{1,#{n}}/)
# => ["123", "456", "789", "0"]

# ==========Test case=================
describe 'Solution' do
  it 'should test for basic tests' do
    Test.assert_equals(towerBuilder(1), ['*'], '1 floor')
    Test.assert_equals(towerBuilder(2), [' * ', '***'], '2 floors')
    Test.assert_equals(towerBuilder(3), ['  *  ', ' *** ', '*****'], '3 floors')
  end

  it 'should test for random tests' do
    def myTowerBuilder(n_floors)
      Array.new(n_floors) do |i|
        ' ' * (n_floors - i - 1) + '*' * (2 * i + 1) + ' ' * (n_floors - i - 1)
      end
    end

    seq = (1..100).to_a
    100.times do |r|
      100.times do |p|
        seq[r], seq[p] = seq[p], seq[r] if rand(2) == 0
      end
    end

    100.times do |r|
      n = seq[r]
      Test.assert_equals(towerBuilder(n), myTowerBuilder(n), "#{n} floor(s)")
    end
  end
end
