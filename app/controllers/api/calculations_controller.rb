# frozen_string_literal: true

class Api::CalculationsController < ApplicationController
  def add
    result = AdditionService.new(params['input']).process

    render json: { result: result }
  end
end
