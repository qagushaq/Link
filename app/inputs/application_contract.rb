# frozen_string_literal: true

class ApplicationContract < Dry::Validation::Contract
  config.messages.default_locale = :en
  config.messages.backend = :i18n
  config.messages.load_paths << Rails.root.join('config/locales/en.inputs.errors.yml')
end
