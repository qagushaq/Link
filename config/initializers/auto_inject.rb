# frozen_String_literal: true

require_relative 'auto_inject/actions'
require_relative 'auto_inject/services'
require_relative 'auto_inject/queries'
require_relative 'auto_inject/workers'

class DryContainer
  extend Dry::Container::Mixin

  extend AutoInjectActions
  extend AutoInjectServices
  extend AutoInjectQueries
  extend AutoInjectWorkers
end

DI = Dry::AutoInject(DryContainer)
