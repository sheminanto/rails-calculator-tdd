# frozen_string_literal: true

class NegativeNumberValidator < BaseValidator
  def initialize(numbers)
    @numbers = numbers
  end

  def validate!
    negative_numbers = @numbers.select(&:negative?)
    raise NegativeNumberException, negative_numbers if negative_numbers.present?
  end
end
