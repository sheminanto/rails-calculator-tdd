# frozen_string_literal: true

class CalculationService
  def initialize(input_string, action: '', validators: [])
    @input_string = input_string
    @action = action
    @validators = validators
  end

  def process
    return 0 if @input_string.empty?

    delimiters, string = parse_delimiter(@input_string)
    numbers = get_numbers_from_string(string, delimiters)
    validate_numbers!(numbers)

    return multiply(string, delimiters) if @action == "*"

    add(string, delimiters)
  end

  private

  def validate_numbers!(numbers)
    @validators.each do |validator|
      validator.new(numbers).validate!
    end
  end

  def parse_delimiter(string)
    return [default_delimiters, string] unless string.start_with?('//')

    delimiters = string.start_with?('//[') ? string.scan(/\[(.*?)\]/).flatten : string.match(/\/\/(.+)\\n/)[1]

    new_input_string = @input_string.split("\\n", 2)[1]
    [delimiters, new_input_string]
  end

  def default_delimiters
    ["\n", ',']
  end

  def add(string, delimiters)
    numbers = get_eligible_numbers_from_string!(string, delimiters)
    numbers.reduce(&:+)
  end

  def multiply(string, delimiters)
    numbers = get_eligible_numbers_from_string!(string, delimiters)
    numbers.reduce(&:*)
  end

  def get_eligible_numbers_from_string!(string, delimiters)
    numbers = get_numbers_from_string(string, delimiters)
    numbers.select { |number| number <= 1000 }
  end

  def get_numbers_from_string(string, delimiters)
    string.split(Regexp.union(delimiters)).map(&:to_i)
  end
end
