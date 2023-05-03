# frozen_string_literal: true

ActionController::Renderers.add :json do |object, options|
  serializer = options.delete(:serializer)
  serializable_hash =
    if serializer.present?
      serializer.new(object, serializer_params(options)).to_hash
    else
      object.to_hash
    end

  send_data Oj.dump(serializable_hash), type: Mime[:json]
end
