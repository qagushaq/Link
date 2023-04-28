# frozen_string_literal: true

# :reek:FeatureEnvy
class Presenters::RecordInvalidPresenter
  def call(error)
    record = error.record
    convert_errors(record.errors, ['', 'data', 'attributes', record.class.name.underscore])
  end

  private

  def convert_errors(errors, prefix)
    errors.map do |error|
      convert_error(error.message, prefix + [error.attribute])
    end
  end

  def convert_error(message, field)
    {
      title: message,
      code: ErrorCodes::INVALID_INPUT,
      status: 422,
      source: { pointer: field.join('/') }
    }
  end
end
