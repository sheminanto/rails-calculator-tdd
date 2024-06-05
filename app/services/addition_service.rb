# frozen_string_literal: true

class AdditionService
  def initialize(input_string)
    @input_string = input_string
  end

  def process
    return 0 if @input_string.empty?

    delimiters, string = parse_delimiter(@input_string)
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
    numbers = string.split(Regexp.union(delimiters)).map(&:to_i)
    negative_numbers = numbers.select(&:negative?)

    raise NegativeNumberException, negative_numbers if negative_numbers.any?

    numbers.reduce { |sum, number| number > 1000 ? sum : sum + number }
  end
end
