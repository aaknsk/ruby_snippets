# frozen_string_literal: true

sentence = %w[hello world this is great]
p sentence

def smash(words)
  words.join(' ')
end

# ==========Test Cases====================

describe 'Smash' do
  it 'The method smash should be defined.' do
    Test.expect(defined?(smash), 'The method smash is not defined.')
  end

  it 'Empty array of words.' do
    Test.assert_equals(smash([]), '')
  end

  it 'One word example should return the word.' do
    Test.assert_equals(smash(['hello']), 'hello')
  end

  it 'Multiple words should be separated by spaces.' do
    Test.assert_equals(smash(%w[hello world]), 'hello world')
    Test.assert_equals(smash(%w[hello amazing world]), 'hello amazing world')
    Test.assert_equals(smash(%w[this is a really long sentence]), 'this is a really long sentence')
  end
end

STR = 'abcdefghijklmnopqrstuvwxyz'.each_char
describe 'Random Tests' do
  it 'should work for random tests' do
    100.times do
      s = (0..rand(0..15)).map { |_x| (0..rand(1..15)).map { |_y| STR.sample }.join }
      expected = s.join(' ')
      Test.assert_equals(smash(s), expected)
    end
  end
end
