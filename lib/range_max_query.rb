# Range max query
# Finds maximum element in subarray of the given array in O(log n)
# see https://en.wikipedia.org/wiki/Range_minimum_query
class RangeMaxQuery
  attr_accessor :size

  MIN = -2**32

  # initalize from array
  def initialize(arr)
    @size = arr.size

    # intialize @val and @idx
    @val = Array.new(@size * 2 + 1, MIN) # values array
    @idx = Array.new(@size * 2 + 1, 0)   # indicies array
    @size.times do |i|
      @val[@size + i] = arr[i]
      @idx[@size + i] = i
    end

    # initialize vertexes
    v = @size - 1
    while v > 0
      l = v * 2 # left child index
      r = l + 1 # right child index
      # set v to to max child
      if @val[l] > @val[r]
        @val[v] = @val[l]
        @idx[v] = @idx[l]
      else
        @val[v] = @val[r]
        @idx[v] = @idx[r]
      end
      v -= 1
    end
  end

  # set el with index i to value
  # XXX: not tested
  def set(i, value)
    i += @size
    @val[i] = value
    v = i / 2
    while v > 0
      l = v * 2 # left child index
      r = l + 1 # right child index
      # set v to to max child
      if @val[l] > @val[r]
        @val[v] = @val[l]
        @idx[v] = @idx[l]
      else
        @val[v] = @val[r]
        @idx[v] = @idx[r]
      end
      v = v / 2
    end
  end

  # get maximum element from range (l, r)
  def max(l, r)
    l += @size
    r += @size
    res = -1
    # while vertexes don't overlap
    while l <= r
      if l % 2 == 1
        # no left subtree
        res = [res, @val[l]].max
      end
      if r % 2 == 0
        # no right subtree
        res = [res, @val[r]].max
      end
      l = (l + 1) / 2 # proceed for left vertex
      r = (r - 1) / 2 # proceed for right vertex
    end

    res
  end

  # get element with index i
  def get(i)
    @val[i + @size]
  end
end
