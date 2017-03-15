# Classic maximum heap
class Heap
  def initialize
    @heap = []
  end

  def add(x)
    @heap << x
    heapify(@heap.size - 1)
  end

  # go up to the root
  def heapify(k)
    return if k == 0
    if @heap[k] > @heap[parent(k)]
      @heap[k], @heap[parent(k)] = @heap[parent(k)], @heap[k]
      heapify(parent(k))
    end
  end

  def get
    return nil if @heap.size == 0
    return @heap.pop if @heap.size == 1
    res = @heap.first
    @heap[0] = @heap.pop
    fix(0)
    res
  end

  # go down and fix
  def fix(k)
    mxk = k
    mxk = left(k) if @heap[left(k)] && @heap[left(k)] > @heap[mxk]
    mxk = right(k) if @heap[right(k)] && @heap[right(k)] > @heap[mxk]
    if mxk != k
      @heap[k], @heap[mxk] = @heap[mxk], @heap[k]
      fix(mxk)
    end
  end

  def peek
    @heap.first
  end

  def size
    @heap.size
  end

  # parent of node k
  def parent(k)
    k / 2
  end

  # left child of node k
  def left(k)
    k * 2
  end

  # right child of node k
  def right(k)
    k * 2 + 1
  end
end
