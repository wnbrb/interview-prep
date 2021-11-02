# https://www.codewars.com/kata/5526fc09a1bbd946250002dc

def find_outlier1(integers)
  integers.group_by(&:odd?).values.sort_by(&:count)[0][0]
end

def find_outlier2(integers)
  odd = integers.select { |number| number % 2 != 0 }
  even = integers.select { |number| number % 2 == 0 }
  return even.count == 1 ? even[0] : odd[0]
end

def find_outlier3(integers)
  even = integers.select(&:even?)
  odd = integers.select(&:odd?)

  return even.count == 1 ? even[0] : odd[0]
end

def find_outlier4(integers)
  integers.slice(0..3).count(&:even?) > 1 ? integers.find(&:odd?) : integers.find(&:even?)
end

require 'benchmark'
n = 50_000
integers = [2, 4, 0, 100, 4, 11, 2602, 36]

Benchmark.bm do |benchmark|
  benchmark.report("Maries first, group_by") do
    n.times do
      find_outlier1(integers)
    end
  end

  benchmark.report("Marie's second, select") do
    n.times do
      find_outlier2(integers)
    end
  end
  benchmark.report("Marie's third, select") do
    n.times do
      find_outlier3(integers)
    end
  end
  benchmark.report("Charlotte's, slice") do
    n.times do
      find_outlier4(integers)
    end
  end
end

