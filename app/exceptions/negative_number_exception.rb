# frozen_string_literal: true

class NegativeNumberException < StandardError
  def initialize(numbers)
    msg = "negative numbers not allowed #{numbers.join(', ')}"
    super(msg)
  end
end
