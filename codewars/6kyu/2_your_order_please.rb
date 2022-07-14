# frozen_string_literal: true

# words = 'is2 Thi1s T4est 3a'

# STEPS
# 単語を配列にする
# 配列にした単語をブロック内の条件で並び替える
# 分割した配列の各要素は、数字を含んでいるから、数字以外の文字を全てカットする
# sort_byに数字を渡したら、昇順に並べ替えるため、1,2,3,4のように期待する順序になる
# 並べ替えた配列の要素をスペースを合わせて結合し、期待する文章を作成する
# ======my ans
def order(words)
  words.split.sort_by { |word| word.gsub(/[^\d]/, '').to_i }.join(' ')
end

# ＝＝＝＝＝smart answer=======
# def order(words)
#   words.split.sort_by{ |w| w[/\d/] }.join(' ')
# end

# def order(words)
# arr = words.split(' ')
# ordered = arr.map do |word|
#   i += 1
#   return word.include?(i.to_s)
# end
# end

# arr = words.split(' ')

# ordered = arr.each_index do |i|
#   i += 1
#   # p arr
#   p arr.detect { |val| return if val.include?(i.to_s) }
# end

# p arr.detect { |val| val.xinclude?(1.to_s) }
# p arr[1]
# p arr[1].include?(1.to_s)

# number_list = [4, 5, 6, 2, 1, 3]
# p ordered
# ==========Test case=================
describe 'Basic tests' do
  it 'should pass fixed tests' do
    Test.assert_equals(order('is2 Thi1s T4est 3a'), 'Thi1s is2 3a T4est')
    Test.assert_equals(order('4of Fo1r pe6ople g3ood th5e the2'), 'Fo1r the2 g3ood 4of th5e pe6ople')
    Test.assert_equals(order('d4o dru7nken sh2all w5ith s8ailor wha1t 3we a6'),
                       'wha1t sh2all 3we d4o w5ith a6 dru7nken s8ailor')
    Test.assert_equals(order(''), '', 'Empty input should return empty string')
    Test.assert_equals(order('3 6 4 2 8 7 5 1 9'), '1 2 3 4 5 6 7 8 9')
  end
end

describe 'Random tests' do
  it 'should pass random tests' do
    $WORDS = 'a able about after all an and as ask at bad be big but by call case child come company day different do early eye fact feel few find first for from get give go good government great group hand have he her high his I important in into it know large last leave life little long look make man my new next not number of old on one or other over own part person place point problem public right same say see seem she small take tell that the their there they thing think this time to try up use want way week will with woman work work world would year you young'.split

    50.times do
      arr = $WORDS.sample(rand(0..9)).map.with_index { |w, i| w.chars.insert(rand(0..w.size), i + 1).join }
      test_str = arr.shuffle.join(' ')
      expected = arr.join(' ')
      Test.assert_equals(order(test_str), expected)
    end
  end
end
