# frozen_string_literal: true

require 'test_helper'

class Api::CalculationsControllerTest < ActionDispatch::IntegrationTest
  def test_should_perform_addition_and_return_result
    post api_calculations_path, params: { calculation: { input: '1,2' } }
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 3, response_json['result']
  end

  def test_should_return_error_when_negative_number_present
    post api_calculations_path, params: { calculation: { input: '1,2,-1' } }
    assert_response :unprocessable_entity
    response_json = JSON.parse(response.body)
    assert_equal response_json['message'], 'negative numbers not allowed -1'
  end
end
