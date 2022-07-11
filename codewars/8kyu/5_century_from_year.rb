# frozen_string_literal: true

# ceilは少数を整数に切り上げする。100で割った際に小数点が発生した場合に、プラス1される
# 直感的でわかりやすい
def century(year)
  (year / 100.0).ceil
end

# 処理内容がシンプルで良いが、ロジックを理解するために少しだけ立ち止まる必要があった
# def century(year)
#   (year - 1) / 100 + 1
# end

# ====first answer=============
# CENTURY = 100
# CENTURY.freeze
# def century(year)
#   (year % CENTURY).zero? ? year / CENTURY : (year / CENTURY) + 1
# end

p century(101)

# ==========Test case=================
describe 'Solution' do
  it 'should return the proper century for each year' do
    Test.assert_equals(century(1705), 18, 'Testing for year 1705')
    Test.assert_equals(century(1900), 19, 'Testing for year 1900')
    Test.assert_equals(century(1601), 17, 'Testing for year 1601')
    Test.assert_equals(century(2000), 20, 'Testing for year 2000')
    Test.assert_equals(century(89), 1, 'Testing for year 89')
  end

  it 'should face the random tests' do
    def century_solution(year)
      ((year - 1) / 100).floor + 1
    end

    for i in 1..200
      year = (rand * 9999).ceil
      Test.assert_equals(century(year), century_solution(year), "Testing for year #{year}")
    end
  end
end
