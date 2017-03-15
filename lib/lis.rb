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
