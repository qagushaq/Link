# frozen_string_literal: true

# InvalidInput error wraps dry-validate's validation value. It contains the `errors` in the form of
# nested hashes with errors presented as the array of messagse, like this:
#
#   {
#     field_one: ['error'],
#     user: {
#       first_name: ['cannot be blank', 'other error']
#     }
#   }
#
class Presenters::InvalidInputPresenter
  def call(error)
    convert_errors(error.errors, ['', 'data', 'attributes'])
  end

  private

  def convert_errors(items, prefix)
    case items
    when Array then convert_messages(messages: items, field: prefix.join('/'))
    when Hash
      items.flat_map do |fld, errors|
        convert_errors(errors, prefix + [fld])
      end
    else raise 'Unknown data type'
    end
  end

  def convert_messages(messages:, field:)
    messages.map do |message|
      {
        title: message,
        code: ErrorCodes::INVALID_INPUT,
        status: 422,
        source: { pointer: field }
      }
    end
  end
end
