# frozen_string_literal: true

RSpec::Matchers.define :have_error do |title|
  match do |body|
    add_condition(proc { |error| error[:title] == title })

    body[:errors].any? { |error| @conditions.all? { |cond| cond.(error) } }
  end

  chain :with_status do |status|
    status = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a?(Symbol)
    add_condition(proc { |error| error[:status] == status })
  end

  chain :on_field do |field|
    add_condition(proc { |error| error.dig(:source, :pointer) == "/data/attributes/#{field}" })
  end

  chain :with_code do |code|
    add_condition(proc { |error| error[:code] == code })
  end

  def add_condition(cond)
    @conditions = (@conditions || []) << cond
  end
end
