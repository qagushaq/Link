# frozen_string_literal: true

module ErrorHandling
  extend ActiveSupport::Concern

  included do
    # Policy violations
    rescue_from ActionPolicy::Unauthorized do |err|
      presenter = Presenters::UnauthorizedPresenter.new
      render json: { errors: presenter.(err) }, status: :forbidden
    end

    # Invalid input format
    rescue_from InvalidInput do |err|
      presenter = Presenters::InvalidInputPresenter.new
      render json: { errors: presenter.(err) }, status: :unprocessable_entity
    end

    # Record is in invalid state
    # rescue_from ActiveRecord::RecordInvalid do |err|
    #   presenter = Presenters::RecordInvalidPresenter.new
    #   render json: { errors: presenter.(err) }, status: :unprocessable_entity
    # end

    # Record is not in the database
    rescue_from ActiveRecord::RecordNotFound do |err|
      presenter = Presenters::RecordNotFoundPresenter.new
      render json: { errors: presenter.(err) }, status: :not_found
    end

    # General request error
    rescue_from RequestError do |err|
      presenter = Presenters::RequestErrorPresenter.new
      render json: { errors: presenter.(err) }, status: err.status
    end
  end
end
