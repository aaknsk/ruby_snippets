# frozen_string_literal: true

# ========solution
def accum(s)
  s.chars.map.with_index { |str, index| (str * (index + 1)).capitalize }.join('-')
end

# =======smart solution
def accum(s)
  s.chars.each_with_index.map { |c, i| c.upcase + c.downcase * i }.join('-')
end

# ==========Test case=================
describe('accum') do
  it('Basic tests') do
    Test.assert_equals(accum('ZpglnRxqenU'),
                       'Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-Uuuuuuuuuuu')
    Test.assert_equals(accum('NyffsGeyylB'),
                       'N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-Bbbbbbbbbbb')
    Test.assert_equals(accum('MjtkuBovqrU'),
                       'M-Jj-Ttt-Kkkk-Uuuuu-Bbbbbb-Ooooooo-Vvvvvvvv-Qqqqqqqqq-Rrrrrrrrrr-Uuuuuuuuuuu')
    Test.assert_equals(accum('EvidjUnokmM'),
                       'E-Vv-Iii-Dddd-Jjjjj-Uuuuuu-Nnnnnnn-Oooooooo-Kkkkkkkkk-Mmmmmmmmmm-Mmmmmmmmmmm')
    Test.assert_equals(accum('HbideVbxncC'),
                       'H-Bb-Iii-Dddd-Eeeee-Vvvvvv-Bbbbbbb-Xxxxxxxx-Nnnnnnnnn-Cccccccccc-Ccccccccccc')
    Test.assert_equals(accum('VwhvtHtrxfE'),
                       'V-Ww-Hhh-Vvvv-Ttttt-Hhhhhh-Ttttttt-Rrrrrrrr-Xxxxxxxxx-Ffffffffff-Eeeeeeeeeee')
    Test.assert_equals(accum('KurgiKmkphY'),
                       'K-Uu-Rrr-Gggg-Iiiii-Kkkkkk-Mmmmmmm-Kkkkkkkk-Ppppppppp-Hhhhhhhhhh-Yyyyyyyyyyy')
    Test.assert_equals(accum('NctlfBlnmfH'),
                       'N-Cc-Ttt-Llll-Fffff-Bbbbbb-Lllllll-Nnnnnnnn-Mmmmmmmmm-Ffffffffff-Hhhhhhhhhhh')
    Test.assert_equals(accum('WegunHvbdmV'),
                       'W-Ee-Ggg-Uuuu-Nnnnn-Hhhhhh-Vvvvvvv-Bbbbbbbb-Ddddddddd-Mmmmmmmmmm-Vvvvvvvvvvv')
    Test.assert_equals(accum('VoywwSpqidE'),
                       'V-Oo-Yyy-Wwww-Wwwww-Ssssss-Ppppppp-Qqqqqqqq-Iiiiiiiii-Dddddddddd-Eeeeeeeeeee')
    Test.assert_equals(accum('VbaixFpxdcO'),
                       'V-Bb-Aaa-Iiii-Xxxxx-Ffffff-Ppppppp-Xxxxxxxx-Ddddddddd-Cccccccccc-Ooooooooooo')
    Test.assert_equals(accum('OlyqvYwkuzF'),
                       'O-Ll-Yyy-Qqqq-Vvvvv-Yyyyyy-Wwwwwww-Kkkkkkkk-Uuuuuuuuu-Zzzzzzzzzz-Fffffffffff')
    Test.assert_equals(accum('JrhfdMtchiH'),
                       'J-Rr-Hhh-Ffff-Ddddd-Mmmmmm-Ttttttt-Cccccccc-Hhhhhhhhh-Iiiiiiiiii-Hhhhhhhhhhh')
    Test.assert_equals(accum('JiwpcSwslvW'),
                       'J-Ii-Www-Pppp-Ccccc-Ssssss-Wwwwwww-Ssssssss-Lllllllll-Vvvvvvvvvv-Wwwwwwwwwww')
    Test.assert_equals(accum('EagpiEvmabJ'),
                       'E-Aa-Ggg-Pppp-Iiiii-Eeeeee-Vvvvvvv-Mmmmmmmm-Aaaaaaaaa-Bbbbbbbbbb-Jjjjjjjjjjj')
    Test.assert_equals(accum('RznlcEmuxxP'),
                       'R-Zz-Nnn-Llll-Ccccc-Eeeeee-Mmmmmmm-Uuuuuuuu-Xxxxxxxxx-Xxxxxxxxxx-Ppppppppppp')
    Test.assert_equals(accum('OrggaExarzP'),
                       'O-Rr-Ggg-Gggg-Aaaaa-Eeeeee-Xxxxxxx-Aaaaaaaa-Rrrrrrrrr-Zzzzzzzzzz-Ppppppppppp')
    Test.assert_equals(accum('DriraMtedfB'),
                       'D-Rr-Iii-Rrrr-Aaaaa-Mmmmmm-Ttttttt-Eeeeeeee-Ddddddddd-Ffffffffff-Bbbbbbbbbbb')
    Test.assert_equals(accum('BjxseRxgtjT'),
                       'B-Jj-Xxx-Ssss-Eeeee-Rrrrrr-Xxxxxxx-Gggggggg-Ttttttttt-Jjjjjjjjjj-Ttttttttttt')
    Test.assert_equals(accum('EquhxOswchE'),
                       'E-Qq-Uuu-Hhhh-Xxxxx-Oooooo-Sssssss-Wwwwwwww-Ccccccccc-Hhhhhhhhhh-Eeeeeeeeeee')
  end
end

def accum_sol6792(s)
  a = s.split('')
  res = ''
  a.each_with_index do |c, i|
    res += c * (i + 1) + '-'
  end
  res.chomp('-').gsub(/\w+/, &:capitalize)
end

$r = Random.new
def do_ex
  i = 0
  res = ''
  while i < 11
    n = i % 5 == 0 ? $r.rand(65..90) : $r.rand(97..122)
    res += n.chr
    i += 1
  end
  res
end

describe('Random Tests') do
  i = 0
  while i < 100
    s1 = do_ex
    Test.assert_equals(accum(s1), accum_sol6792(s1))
    i += 1
  end
end
