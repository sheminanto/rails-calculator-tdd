# frozen_string_literal: true

class AdditionService
  def initialize(input_string, action = "")
    @input_string = input_string
    @action = action
  end

  def process
    return 0 if @input_string.empty?

    delimiters, string = parse_delimiter(@input_string)

    return multiply(string, delimiters) if @action == "*"

    add(string, delimiters)
  end

  private

  def parse_delimiter(string)
    return [default_delimiters, string] unless string.start_with?('//')

    delimiters = string.start_with?('//[') ? string.scan(/\[(.*?)\]/).flatten : string.match(/\/\/(.+)\\n/)[1]

    new_input_string = @input_string.split("\\n",2)[1]
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
    numbers = string.split(Regexp.union(delimiters)).map(&:to_i)
    negative_numbers = numbers.select(&:negative?)
    eligible_numbers = numbers.select { |number| number <= 1000 }

    raise NegativeNumberException, negative_numbers if negative_numbers.any?

    eligible_numbers
  end
end
