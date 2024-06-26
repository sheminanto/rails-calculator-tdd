# frozen_string_literal: true

class Api::CalculationsController < ApplicationController
  def add
    result = AdditionService.new(calculation_params['input'], calculation_params['action']).process

    render json: { result: result }
  rescue NegativeNumberException => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  private

  def calculation_params
    params.require(:calculation).permit(:input, :action)
  end
end
