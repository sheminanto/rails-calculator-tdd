# frozen_string_literal: true

class Api::CalculationsController < ApplicationController
  def create
    result = CalculationService.new(
      calculation_params['input'],
      action: calculation_params['action'], validators: [NegativeNumberValidator]
    ).process

    render json: { result: result }
  rescue NegativeNumberException => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  private

  def calculation_params
    params.require(:calculation).permit(:input, :action)
  end
end
