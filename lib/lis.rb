# calculate Longest Increasing Subsequence length

# dynamic programming, O(n^2)
# See http://www.geeksforgeeks.org/dynamic-programming-set-3-longest-increasing-subsequence/
class LIS
  def find_length(nums)
    return nums.size if nums.size <= 1
    d = Array.new(nums.size) { 1 }
    (1...nums.size).each do |i|
      (0...i).each do |j|
        d[i] = d[j] + 1 if nums[j] < nums[i] && d[i] < d[j] + 1
      end
    end
    d.max
  end
end

# O(n * log n)
# See http://www.geeksforgeeks.org/longest-monotonically-increasing-subsequence-size-n-log-n/
class LISFast < LIS
  def find_length(nums)
    return nums.size if nums.size <= 1
    tail = []
    tail << nums[0]
    (1...nums.size).each do |i|
      if nums[i] < tail[0]
        tail[0] = nums[i]
      elsif nums[i] > tail[-1]
        tail << nums[i]
      else
        tail[bsearch(tail, nums[i])] = nums[i]
      end
    end
    tail.size
  end

  # could be replaced with built-in Array#bsearch
  def bsearch(arr, x)
    l = 0
    r = arr.size
    while l < r
      m = (l + r) / 2
      if arr[m] >= x
        r = m
      else
        l = m + 1
      end
    end
    l
  end
end
