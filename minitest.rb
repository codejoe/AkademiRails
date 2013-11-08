require 'minitest/autorun'

WORDS = {
  0 => "nol",
  1 => "satu",
  2 => "dua",
  3 => "tiga",
  4 => "empat",
  5 => "lima",
  6 => "enam",
  7 => "tujuh",
  8 => "delapan",
  9 => "sembilan"
}

SATUAN = {
  1_000_000 => 'juta',
  1_000 => 'ribu',
  100 => 'ratus'
}

def terbilang(number)
  predefined = WORDS[number]
  return predefined if predefined

  result = []

  SATUAN.each do |key, value|
    if number >= key
      ribuan = number / key
      result << helper(ribuan, value)

      number = number - (ribuan * key)
    end
  end

  if number >= 20 || number == 10
    puluhan = number / 10
    result << helper(puluhan, 'puluh')

    number = number - (puluhan * 10)
  end

  if number > 10
    number -= 10
    result << helper(number, "belas")
  else
    result << terbilang(number) unless number.zero?
  end

  result.join(' ')
end

def helper(number, word)
  if number == 1 && word != "juta"
    "se#{word}"
  else
    "#{terbilang(number)} #{word}"
  end
end

class TerbilangTest < MiniTest::Unit::TestCase
  def test_0
    assert_equal terbilang(0), "nol"
  end
  def test_1
    assert_equal terbilang(1), "satu"
  end
  def test_9
    assert_equal terbilang(9), "sembilan"
  end
  def test_10
    assert_equal terbilang(10), "sepuluh"
  end
  def test_12
    assert_equal terbilang(12), "dua belas"
  end
  def test_18
    assert_equal terbilang(18), "delapan belas"
  end
  def test_20
    assert_equal terbilang(20), "dua puluh"
  end
  def test_21
    assert_equal terbilang(21), "dua puluh satu"
  end
  def test_32
    assert_equal terbilang(32), "tiga puluh dua"
  end
  def test_99
    assert_equal terbilang(99), "sembilan puluh sembilan"
  end
  def test_100
    assert_equal terbilang(100), "seratus"
  end
  def test_200
    assert_equal terbilang(200), "dua ratus"
  end
  def test_999
    assert_equal terbilang(999), "sembilan ratus sembilan puluh sembilan"
  end
  def test_27_265
    assert_equal terbilang(27_265),  "dua puluh tujuh ribu dua ratus enam puluh lima"
  end

  def test_1_000_000
    assert_equal terbilang(1_000_000), "satu juta"
  end
  def test_54_225_342
    assert_equal terbilang(54_225_342), "lima puluh empat juta dua ratus dua puluh lima ribu tiga ratus empat puluh dua"
  end
  def test_11_010_011
    assert_equal terbilang(11_010_011), "sebelas juta sepuluh ribu sebelas"
  end
end