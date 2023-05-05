# frozen_string_literal: true

# Allows to automatically inject dependencies to object constructors from a
# configured container.
# http://dry-rb.org/gems/dry-auto_inject/
module AutoInjectServices
  def self.extended(container)
    container.instance_exec do
      namespace :services do
        register(:validate_input) { ValidateInput.new }

        namespace :authentication do
          register(:with_email_and_password) { Authentication::WithEmailAndPassword.new }
        end

        namespace :sessions do
          register(:create) { Sessions::Create.new }
          register(:delete) { Sessions::Delete.new }
          register(:find) { Sessions::Find.new }
        end

        namespace :users do
          register(:confirm_email) { Users::ConfirmEmail.new }
          register(:create) { Users::Create.new }
          register(:create_email_confirmation_token) { Users::CreateEmailConfirmationToken.new }
        end

        namespace :short_links do
          register(:create) { ShortLinks::Create.new }
          register(:show) { ShortLinks::Show.new }
        end
      end
    end
  end
end
