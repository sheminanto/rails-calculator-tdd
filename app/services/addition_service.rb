# frozen_string_literal: true

class AdditionService
  def initialize(input_string)
    @input_string = input_string
  end

  def process
    return 0 if @input_string.empty?

    delimiters, string = parse_delimiter(@input_string)
    string.split(Regexp.union(delimiters)).map(&:to_i).reduce(&:+)
  end

  private

  def parse_delimiter(string)
    return [default_delimiters, string] unless string.start_with?('//')

    delimiters = string.match(/\/\/(.+)\\n/)[1]
    new_input_string = @input_string.split("\\n",2)[1]
    [delimiters, new_input_string]
  end

  def default_delimiters
    ["\n", ',']
  end
end
