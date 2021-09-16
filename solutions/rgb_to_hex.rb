# https://www.codewars.com/kata/513e08acc600c94f01000001

def rgb(r, g, b)
  nums = [r, g, b]
  hex =
    nums.map do |num|
      num = 255 if num > 255
      num = 0 if num < 0

      num.between?(0, 15) ? "0#{num.to_s(16).upcase}" : num.to_s(16).upcase
    end
  hex.join('')
end

def rgb(r, g, b)
  [r,g,b].reduce("") do |string, i|
    i = 0 if i.negative?
    i = 255 if i > 255
    string += i.abs.to_s(16).rjust(2, '0').upcase
    string
  end
end

def rgb(r, g, b)
    [r, g, b].map do |v|
      if v < 0
        v = 0
      elsif v > 255
        v = 255
      else
        v
      end

      value = v.to_i.to_s(16).upcase
      value.length == 1 ? "0" + value : value
    end.join
  end

def rgb(r, g, b)
    [r, g, b].reduce("") do |memo, color|
        valid_color = color.clamp(0,255)
        memo += convert(valid_color)
    end
end

# -1.clamp(0,255) => 0
# 260.clamp(0,255) => 255
# "this".clamp("thief", "thin") => "thin"

def convert(color)
    hex = %w[0 1 2 3 4 5 6 7 8 9 A B C D E F]
    data = color.divmod(16)
    "#{hex[data[0]]}#{ hex[data[1]]}"
end

puts rgb(255, 255, 255) == "FFFFFF"
puts rgb(255, 255, 300) == "FFFFFF"
puts rgb(-30, 0, 0) == "000000"
puts rgb(148, 0, 211) == "9400D3"
puts rgb(124, 7, 51) == "7C0733"


