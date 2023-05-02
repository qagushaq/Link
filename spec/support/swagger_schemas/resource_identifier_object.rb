# frozen_string_literal: true

module SwaggerSchemas
  # Resource identifier object (https://jsonapi.org/format/#document-resource-identifier-objects)
  RESOURCE_IDENTIFIER_OBJECT = {
    type: 'object',
    properties: {
      id: { type: 'string' },
      type: { type: 'string' }
    },
    required: %w[id type]
  }.freeze
end
