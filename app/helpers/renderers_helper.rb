# frozen_string_literal: true

module RenderersHelper
  private

  def serializer_params(options)
    allowed_params = %i[fields meta links include params]
    params = options.slice(*allowed_params)
    params[:params] ||= {}
    inject_current_user(params)
    params
  end

  def inject_current_user(params)
    params[:params].merge!(
      current_session: current_session,
      current_user: current_user
    )
  end
end
