class Fixnum
  WORDS = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",

    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",

    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
  }

  MAGNITUDES = {
    100               => "hundred",
    1_000             => "thousand",
    1_000_000         => "million",
    1_000_000_000     => "billion",
    1_000_000_000_000 => "trillion"
  }

  def in_words
    if WORDS.include?(self)
      return WORDS[self]
    elsif self < 100
      number = WORDS[self/10 * 10]
      number += " #{WORDS[self % 10]}"
      number
    else
      magnitude = find_next_magnitude
      all_magnitudes = (self / magnitude).in_words + " " + MAGNITUDES[magnitude]
      if self % magnitude != 0
        all_magnitudes + " " + (self % magnitude).in_words
      else
        all_magnitudes

      end
    end
  end

  def find_next_magnitude
    MAGNITUDES.keys.select { |magnitude| magnitude <= self }[-1]

  end


end
