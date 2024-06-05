# frozen_string_literal: true

class Api::CalculationsController < ApplicationController
  def add
    result = AdditionService.new(params['input']).process

    render json: { result: result }
  rescue NegativeNumberException => e
    render json: { message: e.message }, status: :unprocessable_entity
  end
end
