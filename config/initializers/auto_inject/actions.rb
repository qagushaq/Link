# frozen_string_literal: true

# Allows to automatically inject dependencies to object constructors from a
# configured container.
# http://dry-rb.org/gems/dry-auto_inject/
module AutoInjectActions
  def self.extended(container)
    container.instance_exec do
      namespace :actions do
        namespace :auth do
          register(:sign_in) { Auth::SignInAction.new }
          register(:sign_out) { Auth::SignOutAction.new }
        end

        namespace :confirm_email do
          register(:confirm_by_token) { ConfirmEmail::ConfirmByTokenAction.new }
          register(:send_token) { ConfirmEmail::SendTokenAction.new }
        end

        namespace :users do
          register(:create) { Users::CreateAction.new }
        end
      end
    end
  end
end
