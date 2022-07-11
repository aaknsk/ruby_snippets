# frozen_string_literal: true

# ===Best===========
# 7→1に変換するから、7の個数分*6が計算結果となる
# charsで文字列を各文字に分割した配列を作り、mapで非破壊的に新しくasciiコードの配列を返す
# asciiを全部joinして、7の数を数えて、*6をして計算結果を返す
# ★正直に解決しようとするのではなくて、簡略化できそうな点はないのか？考える
def calc(s)
  s.chars.map(&:ord).join.count('7') * 6
end

# ========first answer without digits method
# def calc(s)
#   # string to ascii codes
#   total1 = s.bytes.join
#   total2 = total1.gsub('7', '1')

#   sum_total1_digits = 0
#   sum_total2_digits = 0
#   total1.split(//).each do |str|
#     sum_total1_digits += str.to_i
#   end
#   total2.split(//).each do |str|
#     sum_total2_digits += str.to_i
#   end
#   sum_total1_digits - sum_total2_digits
# end

# def calc(s)
#   total1 = s.bytes.join
#   total2 = total1.gsub('7', '1')
#   total1.to_i.digits.sum - total2.to_i.digits.sum
# end

# =====for test======
# arr = %w[9 7 9 8 9 9 1 0 0]
# arr = %w[5 5 5 5 5 5 5 5 5]

# sum_total1_digits = 0
# sum_total2_digits = 0
# arr.each do |str|
#   sum_total1_digits += str.to_i
# end

# p sum

# calc('abcd')
# ==========Test case=================
describe 'Solution' do
  it 'Fixed tests' do
    expect(calc('abcdef')).to eq(6)
    expect(calc('ifkhchlhfd')).to eq(6)
    expect(calc('aaaaaddddr')).to eq(30)
    expect(calc('jfmgklf8hglbe')).to eq(6)
    expect(calc('jaam')).to eq(12)
    expect(calc('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')).to eq(96)
  end

  it 'Random tests' do
    def randint(a, b)
      rand(b - a + 1) + a
    end

    def sol(s)
      s.split('').map { |a| a.ord }.join.count('7') * 6
    end
    base = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

    40.times do
      s = (0..randint(1, 25)).map { base[randint(0, base.size - 1)] }.join
      expect(calc(s)).to eq(sol(s)), "Testing for #{s.inspect}"
    end
  end
end
