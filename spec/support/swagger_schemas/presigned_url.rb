# frozen_string_literal: true

# Presigned S3 URL schema
module SwaggerSchemas
  PRESIGNED_URL = {
    type: 'object',
    properties: {
      method: { type: 'string' },
      url: { type: 'string' },
      fields: {
        type: 'object',
        properties: {
          'key' => { type: 'string' },
          'policy' => { type: 'string' },
          'x-amz-credential' => { type: 'string' },
          'x-amz-algorithm' => { type: 'string' },
          'x-amz-date' => { type: 'string' },
          'x-amz-signature' => { type: 'string' },
          'success_action_status' => { type: 'string' },
          'Content-Type' => { type: 'string' },
          'Content-Disposition' => { type: 'string' }
        },
        required: %w[key policy x-amz-credential x-amz-algorithm x-amz-date x-amz-signature]
      },
      headers: { type: 'object' }
    },
    required: %w[method url fields]
  }.freeze
end
