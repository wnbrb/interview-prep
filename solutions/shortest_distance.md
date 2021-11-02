### Shortest Word Distance

Given an array of strings wordsDict and two different strings that already exist in the array word1 and word2, return the shortest distance between these two words in the list.

Example 1:

```
Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "coding", word2 = "practice"
Output: 3
```

Example 2:

```
Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "coding"
Output: 1
```

Constraints:

- `1 <= wordsDict.length <= 3 * 104`
- `1 <= wordsDict[i].length <= 10`
- `wordsDict[i]`consists of lowercase English letters.
- `word1` and `word2` are in `wordsDict`.
- `word1` != `word2`

Solution

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
