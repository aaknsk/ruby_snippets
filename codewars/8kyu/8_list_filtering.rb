# frozen_string_literal: true

arr = [1, 2, 'a', 'b']

def filter_list(list)
  list.select { |val| val.is_a?(Integer) }
end

# p arr.filter { |val| val.is_a?(Integer) }

# ====other answer
# def filter_list(l)
#   l.reject { |x| x.is_a? String }
# end

# ==========Test case=================
describe 'Filter List' do
  it 'Fixed Tests' do
    Test.assert_equals(filter_list([1, 2, 'a', 'b']), [1, 2])
    Test.assert_equals(filter_list([1, 'a', 'b', 0, 15]), [1, 0, 15])
    Test.assert_equals(filter_list([1, 2, 'aasf', '1', '123', 123]), [1, 2, 123])
    Test.assert_equals(filter_list(%w[a b 1]), [])
    Test.assert_equals(filter_list([1, 2, 'a', 'b']), [1, 2])
  end

  it 'Random Tests' do
    50.times do
      len = rand(5..20)
      arr = Array.new(len) { rand < 0.7 ? rand(100) : [*'a'..'z'].sample(rand(5..10)).join }
      it "Test: #{arr}" do
        Test.assert_equals(filter_list(arr), arr.grep_v(String))
      end
    end
  end
end
