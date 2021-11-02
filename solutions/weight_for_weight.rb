# https://www.codewars.com/kata/55c6126177c9441a570000cc/train/ruby

def order_weight(string)
  # make a proper array
  array = string.split(/\s+/)
  # create a hash of string (key) and weight/sum of digits (value)
  # hash = {}
  # array.each do |number|
  #   hash[number] = number.to_i.digits.sum
  # end

  reduced_hash = array.reduce({}) do |memo, number|
    memo[number] = number.to_i.digits.sum
    memo
  end

  # sort by values
  # break tie with string sorting
  result = reduced_hash.sort_by { |key, value| [value, key] }
  # convert results into a string
  string = ""
  result.each do |number_pair|
    string << "#{number_pair[0]} "
  end
  p string[0..-2]
end

# test cases
p order_weight("103 123 4444 99 2000") == "2000 103 123 4444 99"
# p order_weight("2000 10003 1234000 44444444 9999 11 11 22 123") == "11 11 2000 10003 22 123 1234000 44444444 9999"
p order_weight("56   65 74 100 99   68 86   180 90   ") == "100 180 90 56 65 74 68 86 99"
