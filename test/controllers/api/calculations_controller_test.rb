# frozen_string_literal: true

require 'test_helper'

class Api::CalculationsControllerTest < ActionDispatch::IntegrationTest
  def test_should_perform_addition_and_return_result
    post add_api_calculations_path, params: { input: '1,2' }
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 3, response_json['result']
  end
end
