# frozen_string_literal: true

# User profile
module SwaggerSchemas
  SHORT_LINK = {
    type: 'object',
    properties: {
      id: { type: 'string' },
      type: { type: 'string' },
      attributes: {
        type: 'object',
        properties: {
          url: { type: 'string' },
          slug: { type: 'string' }
        },
        required: %w[url slug]
      }
    },
    required: %w[id type attributes]
  }.freeze
end
