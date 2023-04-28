# frozen_string_literal: true

class ValidateInput
  def call(input_class, params)
    input = input_class.new
    result = input.(params)

    check_result(result)

    result.to_h
  end

  def check_result(result)
    return if result.success?

    raise InvalidInput.new('Invalid input', result: result)
  end
end
