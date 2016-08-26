require 'test/unit'
require 'shoulda-context'
require_relative '../lib/heap.rb'

class HeapTest < Test::Unit::TestCase
  context 'heap' do
    setup do
      @heap = Heap.new
    end

    context 'normal operations' do
      should 'add and get element' do
        @heap.add(42)
        assert_equal 42, @heap.peek
        assert_equal 1, @heap.size
      end

      should 'peek max element' do
        [15, 24, 11, 57, 73, 88, 12, 29, 13, 31].map { |e| @heap.add(e) }
        assert_equal 10, @heap.size
        assert_equal 88, @heap.peek
        assert_equal 10, @heap.size
      end

      should 'get max element' do
        [15, 24, 11, 57, 73, 88, 12, 29, 13, 31].each { |e| @heap.add(e) }
        assert_equal 10, @heap.size
        assert_equal 88, @heap.get
        assert_equal 9, @heap.size
      end

      should 'sort elements' do
        [15, 24, 11, 57, 73, 88, 12, 29, 13, 31].each { |e| @heap.add(e) }
        assert_equal 10, @heap.size
        arr = []
        10.times { arr << @heap.get }
        assert_equal arr.sort.reverse, arr
      end
    end

    context 'edge cases' do
      should 'return nil on empty heap' do
        assert_equal nil, @heap.peek
        assert_equal 0, @heap.size
      end

      should 'not emptify' do
        @heap.add(42)
        @heap.get
        assert_equal nil, @heap.get
        assert_equal 0, @heap.size
        @heap.add(42)
        assert_equal 42, @heap.peek
        assert_equal 1, @heap.size
      end

      context 'work with pre-sorted elements' do
        should 'in asc order' do
          [11, 12, 13, 15, 24, 29, 31, 57, 73, 88].each { |e| @heap.add(e) }
          arr = []
          10.times { arr << @heap.get }
          assert_equal arr.sort.reverse, arr
        end

        should 'in desc order' do
          [88, 73, 57, 31, 29, 24, 15, 13, 12, 11].each { |e| @heap.add(e) }
          arr = []
          10.times { arr << @heap.get }
          assert_equal arr.sort.reverse, arr
        end
      end

      should 'work with equal elements' do
        arr = Array.new(10, 87)
        arr.each { |e| @heap.add(e) }
        heap_arr = []
        10.times { heap_arr << @heap.get }
        assert_equal arr, heap_arr
      end
    end

    context 'random' do
      should 'sort random array' do
        arr = Array.new(1000, Random.rand(1000))
        arr.each { |e| @heap.add(e) }
        heap_arr = []
        heap_arr << @heap.get while @heap.size > 0
        assert_equal arr.sort.reverse, heap_arr
      end
    end
  end
end
