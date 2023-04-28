# frozen_string_literal: true

class Presenters::RecordNotFoundPresenter
  def call(error)
    [{ title: error.message, status: 404, code: ErrorCodes::NOT_FOUND }]
  end
end
