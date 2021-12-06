# https://www.codewars.com/kata/52ae6b6623b443d9090002c8/train/ruby

def guess_gifts(wishlist, presents)

  possible_gifts = []
  presents.each do |present_hash|
    wishlist.each do |wish_hash|
      next unless present_hash[:size] == wish_hash[:size]
      next unless present_hash[:clatters] == wish_hash[:clatters]
      next unless present_hash[:weight] == wish_hash[:weight]

      possible_gifts << wish_hash[:name]
    end..
  end
  possible_gifts.uniq
end


# tests
wishlist = [
  {:name => "mini puzzle", :size => "small", :clatters => "yes", :weight => "light"},
  {:name => "toy car", :size => "medium", :clatters => "a bit", :weight => "medium"},
  {:name => "card game", :size => "small", :clatters => "no", :weight => "light"}
]
presents =  [
  {:size => "medium", :clatters => "a bit", :weight => "medium"},
  {:size => "small", :clatters => "yes", :weight => "light"}
]
expected = ['toy car', 'mini puzzle']

p guess_gifts(wishlist, presents).sort == expected.sort
