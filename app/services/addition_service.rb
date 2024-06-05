# frozen_string_literal: true

class AdditionService
  def initialize(input_string)
    @input_string = input_string
  end

  def process
    @input_string.split(',').map(&:to_i).reduce(&:+)
  end
end
