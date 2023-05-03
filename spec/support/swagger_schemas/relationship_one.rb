# frozen_string_literal: true

module SwaggerSchemas
  # Relationship -- one member
  RELATIONSHIP_ONE = {
    type: 'object',
    properties: {
      data: { '$ref': '#/components/schemas/resource_identifier_object' }
    }
  }.freeze
end
