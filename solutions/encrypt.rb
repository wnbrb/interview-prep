# https://www.codewars.com/kata/57814d79a56c88e3e0000786

def encrypt(text, n)
  return text if text.empty? || n <= 0

  n.times do
    odd_indexed = ""
    even_indexed = ""
    text.each_char.with_index do |char, index|
      if index.even?
        even_indexed << char
      else
        odd_indexed << char
      end
    end
    text = odd_indexed + even_indexed
  end
  text
end

def decrypt(encrypted_text, n)
  n.times do
    # split in half
    middle = encrypted_text.length / 2
    odd_indexed = encrypted_text[0...middle].chars
    even_indexed = encrypted_text[middle..-1].chars
    # p "odd_indexed #{odd_indexed}"
    # p "even_indexed #{even_indexed}"
    result = ""
    encrypted_text.length.times do |i|
      if i.even?
        result << even_indexed.shift
      else
        result << odd_indexed.shift
      end
    end
    encrypted_text = result
  end
  p encrypted_text
end

# Tests:

p encrypt("012345", 1)  =>  "135024"
p encrypt("012345", 2) == "304152"
p encrypt("012345", 3) == "012345"
p encrypt("This is a test!", 1) == "hsi  etTi sats!"

p decrypt("135024", 1) == "012345"
p decrypt("13024", 1) == "01234"
p decrypt("hsi  etTi sats!", 1) == "This is a test!"
p decrypt("s eT ashi tist!", 2) == "This is a test!"
p decrypt(" Tah itse sits!", 3) == "This is a test!"
