# frozen_string_literal: true

# Allows to automatically inject dependencies to object constructors from a
# configured container.
# http://dry-rb.org/gems/dry-auto_inject/
module AutoInjectWorkers
  def self.extended(container)
    container.instance_exec do
      namespace :workers do
        namespace :push_notifications do
          register(:deliver) { PushNotifications::DeliverWorker.new }
          register(:deliver_to_user) { PushNotifications::DeliverToUserWorker.new }
        end

        namespace :users do
          register(:send_email_confirmation_request) { Users::SendEmailConfirmationRequestWorker.new }
        end
      end
    end
  end
end
