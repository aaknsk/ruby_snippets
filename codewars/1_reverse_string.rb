# frozen_string_literal: true

def solution(str)
  str.reverse if str.instance_of? String
end

# ==========Test Cases====================
describe 'Fixed tests' do
  it 'should pass fixed tests' do
    Test.assert_equals(solution('world'), 'dlrow')
    Test.assert_equals(solution('hello'), 'olleh')
    Test.assert_equals(solution(''), '')
    Test.assert_equals(solution('h'), 'h')
  end
end

# set target string array
STR = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ   '.each_char

describe 'Random tests' do
  it 'should pass random tests' do
    100.times do
      s = (0..rand(0..20)).map { |_x| STR.sample }.join
      expected = s.reverse
      Test.assert_equals(solution(s), expected)
    end
  end
end
