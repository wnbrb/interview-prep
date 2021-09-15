<!-- # https://leetcode.com/problems/container-with-most-water/ -->

# Container with most water

[Check out the instructions on Leetcode](https://leetcode.com/problems/container-with-most-water)

JavaScript solution:

```javascript
const maxArea = function (height) {
  let maxContainer = 0;
  let start = 0;
  let end = height.length - 1;

  while (start < end) {
    let first = height[start];
    let second = height[end];

    let area = Math.min(first, second) * (end - start);

    maxContainer = Math.max(area, maxContainer);

    first > second ? (end = end - 1) : (start = start + 1);
  }

  return maxContainer;
};
```

Ruby solution:

```ruby
def max_area(height)
    l = 0
    r = (height.length - 1)
    max_area = 0

    while l < r
        new_area = [height[l], height[r]].min * (r - l)
        max_area = [max_area, new_area].max
        if height[l] < height[r]
            l += 1
        else
            r -= 1
        end
    end
    max_area
end
```
