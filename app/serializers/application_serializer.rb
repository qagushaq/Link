# frozen_string_literal: true

class ApplicationSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  # Serializes a general-purpose attachment
  def self.serialize_attachment(attachment)
    return nil if attachment.blank?

    metadata = attachment.metadata
    {
      url: attachment.url,
      filename: metadata['filename'],
      size: metadata['size'],
      mimeType: metadata['mime_type']
    }
  end
end
