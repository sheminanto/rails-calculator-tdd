# frozen_string_literal: true

require 'test_helper'

class AdditionServiceTest < ActiveSupport::TestCase
  def test_should_perform_addition
    sum = AdditionService.new('1,2,3').process
    assert_equal 6, sum
  end

  def test_should_return_zero_if_the_string_is_empty
    sum = AdditionService.new('').process
    assert_equal 0, sum
  end

  def test_should_allow_new_line_as_delimiter
    sum = AdditionService.new('1\n,2,3').process
    assert_equal 6, sum
  end
end
