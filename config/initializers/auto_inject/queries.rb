# frozen_string_literal: true

# Allows to automatically inject dependencies to object constructors from a
# configured container.
# http://dry-rb.org/gems/dry-auto_inject/
module AutoInjectQueries
  def self.extended(container)
    container.instance_exec do
      namespace :queries do
        namespace :users do
          register(:find_by_reset_password_token) { Users::FindByResetPasswordTokenQuery.new }
        end
      end
    end
  end
end
