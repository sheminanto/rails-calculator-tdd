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

  def test_should_allow_custom_delimiter
    sum = AdditionService.new('//;\n1;2;3').process
    assert_equal 6, sum
  end

  def test_should_throw_error_if_negative_number_present
    error = assert_raise NegativeNumberException do
      AdditionService.new('//;\n1;-2;-3').process
    end
    error_message = 'negative numbers not allowed -2, -3'
    assert_equal error_message, error.message
  end
end
