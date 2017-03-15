# calculate Longest Increasing Subsequence length
# O(n * log n)
# See http://www.geeksforgeeks.org/longest-monotonically-increasing-subsequence-size-n-log-n/
class LISFast
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
