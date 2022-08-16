# frozen_string_literal: true

# ========solution
# replace A & T, C & G
def dna_strand(dna)
  arr = []
  dna.chars.each do |str|
    arr << 'A' if str == 'T'
    arr << 'T' if str == 'A'
    arr << 'C' if str == 'G'
    arr << 'G' if str == 'C'
  end
  arr.join
end

# =======smart solution
def DNA_strand(dna)
  dna.tr('ACTG', 'TGAC')
end

# $pairs = {'A'=>'T','T'=>'A','C'=>'G','G'=>'C'}
# def DNA_strand(dna)
#   dna.chars.map{|c| $pairs[c] }.join
# end

# def DNA_strand(dna)
#   dna.gsub(/[ATGC]/, "A" => "T", "T" => "A", "C" => "G", "G" => "C")
# end

# ==========Test case=================
describe 'DNA_strand' do
  it 'should pass basic tests' do
    Test.assert_equals(DNA_strand('AAAA'), 'TTTT', 'String AAAA is')
    Test.assert_equals(DNA_strand('ATTGC'), 'TAACG', 'String ATTGC is')
    Test.assert_equals(DNA_strand('GTAT'), 'CATA', 'String GTAT is')
    Test.assert_equals(DNA_strand('AAGG'), 'TTCC', 'String AAGG is')
    Test.assert_equals(DNA_strand('CGCG'), 'GCGC', 'String CGCG is')
    Test.assert_equals(DNA_strand('ATTGC'), 'TAACG', 'String ATTGC is')
    Test.assert_equals(DNA_strand('GTATCGATCGATCGATCGATTATATTTTCGACGAGATTTAAATATATATATATACGAGAGAATACAGATAGACAGATTA'),
                       'CATAGCTAGCTAGCTAGCTAATATAAAAGCTGCTCTAAATTTATATATATATATGCTCTCTTATGTCTATCTGTCTAAT')
  end

  it 'should pass random tests' do
    base = %w[A C G T]
    def randint(a, b)
      rand(b - a + 1) + a
    end

    def DNASol(dna)
      dna.split('').map do |nuc|
        if nuc == 'A'
          'T'
        elsif nuc == 'T'
          'A'
        else
          nuc == 'C' ? 'G' : 'C'
        end
      end.join
    end

    40.times do
      testdna = ''
      testlen = randint(5, 30)
      testlen.times { testdna += base[randint(0, 3)] }
      exp = DNASol(testdna)
      Test.assert_equals(DNA_strand(testdna), exp, "dna: #{testdna.inspect}")
    end
  end
end
