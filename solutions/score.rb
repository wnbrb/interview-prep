# https://www.codewars.com/kata/57eb8fcdf670e99d9b000272/train/ruby

def high(x)
  x << " "
  alphabet = ("a".."z").to_a            # constant time / O(1)
  result = ""                           # constant time / O(1)
  score = 0                             # constant time / O(1)

  word_score = 0
  current_word = ""
  x.each_char do |char|
    if char != " "
      char_score = alphabet.index(char) + 1
      word_score += char_score
      current_word << char
    else
      p "current_word #{current_word}"
      p "score: #{score}"
      p "word_score #{word_score}"
      if word_score > score
        result = current_word
        score = word_score
      end
      current_word = ""
      word_score = 0
    end
  end
  p result
  result
  # words = x.split(/\s/)
  # words.each do |word|
  #   word_score = 0
  #   word.each_char do |char|
  #     # find value of each character
  #     char_score = alphabet.index(char) + 1
  #     word_score += char_score
  #   end

  #   if word_score > score
  #     result = word
  #     score = word_score
  #   end
  # end
  # result
end
 # O(n^2)

# Tests
# p high('aa b') == 'aa'    # O(4)   - ["aa", "b"] O(2)
# p high('b aa') == 'b'
# p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'

