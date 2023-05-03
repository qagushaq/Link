# frozen_string_literal: true

# User session
module SwaggerSchemas
  SESSION = {
    type: 'object',
    properties: {
      id: { type: 'string' },
      type: { type: 'string' },
      attributes: {
        type: 'object',
        properties: {
          token: { type: 'string' }
        },
        required: %w[token]
      },
      relationships: {
        type: 'object',
        properties: {
          user: { '$ref': '#/components/schemas/relationship_one' }
        }
      }
    },
    required: %w[id type attributes]
  }.freeze
end
