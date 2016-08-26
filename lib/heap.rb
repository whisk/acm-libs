# Classic maximum heap
class Heap
  attr_accessor :size, :heap

  def initialize
    @heap = []
    @size = 0
  end

  # add an element
  def add(el)
    @size += 1
    @heap[@size - 1] = el
    sift(@size - 1)
  end

  # returns max element
  def peek
    return nil if @size == 0
    @heap[0]
  end

  # returns and removes max element
  def get
    return nil if @size == 0

    max_el = @heap[0]
    @heap[0] = @heap[@size - 1]
    @size -= 1
    fix_one_error(0)

    max_el
  end

  private

  def parent(idx)
    idx / 2
  end

  def left_child(idx)
    2 * idx + 1
  end

  def right_child(idx)
    2 * idx + 2
  end

  def leaf?(idx)
    idx >= @size / 2
  end

  def satisfied?(idx)
    lk = @heap[left_child(idx)]
    rk = @heap[right_child(idx)]
    (lk.nil? || @heap[idx] >= lk) && (rk.nil? || @heap[idx] >= rk)
  end

  def sift(idx)
    return if idx == 0

    p = parent(idx)
    if @heap[p] < @heap[idx]
      @heap[p], @heap[idx] = @heap[idx], @heap[p]
      sift(p)
    end
  end

  def fix_one_error(idx)
    return if leaf?(idx) || satisfied?(idx)

    # find max child
    max_child = @heap[left_child(idx)] > @heap[right_child(idx)] ? left_child(idx) : right_child(idx)
    # swap
    @heap[idx], @heap[max_child] = @heap[max_child], @heap[idx]

    # continue on max child
    fix_one_error(max_child)
  end
end
