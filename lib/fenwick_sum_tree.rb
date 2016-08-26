# Fenwick sum tree
# Finds sum of subarray of the given array in O(log n)
# see https://en.wikipedia.org/wiki/Fenwick_tree
class FenwickSumTree
  attr_accessor :size

  def initialize(arr)
    @size = arr.size
    @t    = Array.new(@size, 0)

    @size.times do |i|
      inc(i, arr[i])
    end
  end

  def sum(l, r)
    sum_r(r) - sum_r(l - 1)
  end

  private

  def sum_r(r)
    res = 0
    while r >= 0
      res += @t[r]
      r = (r & (r + 1)) - 1 # tricky one! F function
    end

    res
  end

  def inc(idx, delta)
    i = idx
    while i < size
      @t[i] += delta
      i = (i | (i + 1)) # tricky one! F function
    end
  end
end
