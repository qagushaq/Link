# frozen_string_literal: true

class Presenters::UnauthorizedPresenter
  def call(error)
    error.result.reasons.full_messages.map do |message|
      { title: message, code: ErrorCodes::UNAUTHORIZED, status: 403 }
    end
  end
end
