# frozen_string_literal: true

require 'test_helper'

class AdditionServiceTest < ActiveSupport::TestCase
  def test_should_perform_addition
    sum = AdditionService.new('1,2,3').process
    assert_equal 6, sum
  end
end
