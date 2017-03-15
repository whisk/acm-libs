require 'test/unit'
require 'shoulda-context'
require_relative '../lib/lis_fast.rb'

class LisFastTest < Test::Unit::TestCase
  context 'LISFast' do
    setup do
      @lis = LISFast.new
    end
    should 'find length for empty sequence' do
      assert_equal 0, @lis.find_length([])
    end

    should 'find length for sequence of 1 element' do
      assert_equal 1, @lis.find_length([1])
    end

    should 'find length for random sequences' do
      assert_equal 6, @lis.find_length([9, 2, 11, 18, 17, 12, 17, 18, 10, 16, 11, 4, 4, 5, 9, 15, 13, 18, 4, 4])
      assert_equal 5, @lis.find_length([6, 1, 3, 0, 8, 7, 5, 1, 9, 5, 7, 5, 8, 4, 0, 4, 4, 6, 4, 2])
      assert_equal 7, @lis.find_length([765, 855, 278, 225, 225, 204, 333, 504, 429, 57, 47, 997, 836, 951, 690, 787, 464, 840, 992, 146])
      assert_equal 5, @lis.find_length([4, 1, 1, 2, 3, 4, 1, 2, 3, 0, 2, 4, 1, 1, 0, 2, 1, 2, 3, 4])
      assert_equal 5, @lis.find_length([9, 16, 17, 11, 2, 19, 18, 6, 1, 12, 14, 10, 3, 7, 8, 0, 4, 15, 13, 5])
    end

    should 'find length for mixed sequence' do
      assert_equal 12, @lis.find_length([19, 16, 10, 1, 17, 5, 6, 7, 8, 9, 15, 19, 19, 6, 13, 15, 16, 17, 18, 19])
    end

    should 'find length for increasing sequence' do
      assert_equal 20, @lis.find_length([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19])
    end

    should 'find length for decreasing sequence' do
      assert_equal 1, @lis.find_length([19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0])
    end
  end
end
