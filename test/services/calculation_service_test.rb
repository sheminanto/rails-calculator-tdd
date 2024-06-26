# frozen_string_literal: true

require 'test_helper'

class CalculationServiceTest < ActiveSupport::TestCase
  def test_should_perform_addition
    sum = CalculationService.new('1,2,3').process
    assert_equal 6, sum
  end

  def test_should_return_zero_if_the_string_is_empty
    sum = CalculationService.new('').process
    assert_equal 0, sum
  end

  def test_should_allow_new_line_as_delimiter
    sum = CalculationService.new('1\n,2,3').process
    assert_equal 6, sum
  end

  def test_should_allow_custom_delimiter
    sum = CalculationService.new('//;\n1;2;3').process
    assert_equal 6, sum
  end

  def test_should_throw_error_if_negative_number_present
    error = assert_raise NegativeNumberException do
      CalculationService.new('//;\n1;-2;-3').process
    end
    error_message = 'negative numbers not allowed -2, -3'
    assert_equal error_message, error.message
  end

  def test_ignore_numbers_greater_than_thousand
    sum = CalculationService.new('//;\n1;2;1001').process
    assert_equal 3, sum
  end

  def test_should_allow_delimiter_with_any_length
    sum = CalculationService.new('//[***]\n1***2***3').process
    assert_equal 6, sum
  end

  def test_should_allow_multiple_delimiters
    sum = CalculationService.new('//[*][%]\n1*2%3').process
    assert_equal 6, sum
  end

  def test_should_allow_multiple_delimiter_with_more_than_one_character
    sum = CalculationService.new('//[***][%%%]\n1***2%%%3').process
    assert_equal 6, sum
  end

  def test_should_multiply_if_asterisk_present
    sum = CalculationService.new('//[***][%%%]\n1***2%%%4', '*').process
    assert_equal 8, sum
  end

  def test_should_raise_exemption_when_negative_numbers_are_present_while_performing_multiplicatin
    error = assert_raise NegativeNumberException do
      CalculationService.new('//;\n1;-2;-3', '*').process
    end
    error_message = 'negative numbers not allowed -2, -3'
    assert_equal error_message, error.message
  end

  def test_should_acccept_custom_validation_for_even_numbers
    error = assert_raise StandardError do
      CalculationService.new('//;\n1;2;3', '*').process do |numbers|
        even_numbers = numbers.map(&:even?)

        raise "Even number exception" if even_numbers.present?
      end
    end
    assert_equal "Even number exception", error.message
  end
end
