### Shortest Word Distance

```Ruby
# @param {String[]} words_dict
# @param {String} word1
# @param {String} word2
# @return {Integer}
def shortest_distance(words_dict, word1, word2)
    min_distance = words_dict.length
    index1 = -1
    index2 = -1
    words_dict.each_with_index do |word, index|
        if word == word1
            index1 = index
        elsif word == word2
             index2 = index
        end

        if index1 >= 0 && index2 >= 0
            min_distance = [min_distance, (index1 - index2).abs].min
        end
    end
    min_distance
end
```
