# https://leetcode.com/problems/reverse-bits/


def reverse_bits(n)
    result =  n.to_s(2).reverse
    zeros = Array.new(32-result.length) {"0"}
    # zeroes = Array.new(32-result.length, "0")
    return (result+zeros.join("")).to_i(2)
end

def reverse_bits(n)
  (0..32).inject(0) { |total, i| total += (n >> i & 1)<<(31-i) }
end

# bitwise &
# 0 & 0 = 0
# 0 & 1 = 0
# 1 & 0 = 0
# 1 & 1 = 1


# # << >> bitwise shift
# s = 555;  # 555 in decimal
#    # in binary, that's 001000101011

# int foo = s >> 4;

# # s >> 0 = 001000101011
# # s >> 1 = 000100010101
# # s >> 2 = 000010001010
# # s >> 3 = 000001000101
# # s >> 4 = 000000100010

# 000000100010 is 34 in decimal
