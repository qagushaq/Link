# frozen_string_literal: true

# OAuth authentication info
module SwaggerSchemas
  AUTH_INFO = {
    type: 'object',
    properties: {
      id: { type: 'string' },
      type: { type: 'string' },
      attributes: {
        type: 'object',
        properties: {
          email: { type: 'string', format: 'email', nullable: true }
        }
      }
    }
  }.freeze
end



