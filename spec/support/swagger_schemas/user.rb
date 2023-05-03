# frozen_string_literal: true

# User profile
module SwaggerSchemas
  USER = {
    type: 'object',
    properties: {
      id: { type: 'string' },
      type: { type: 'string' },
      attributes: {
        type: 'object',
        properties: {
          email: { type: 'string', format: 'email' },
          emailConfirmed: { type: 'boolean' }
        },
        required: %w[email emailConfirmed]
      }
    },
    required: %w[id type attributes]
  }.freeze
end
