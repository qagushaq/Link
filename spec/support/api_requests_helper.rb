# frozen_string_literal: true

# :reek:DataClump
module ApiRequestsHelper
  DEFAULT_HEADERS = {
    'CONTENT_TYPE' => 'application/json',
    'ACCEPT' => 'application/json',
    'HTTP_USER_AGENT' => 'rspec'
  }.freeze

  def get(path, options = {}, &block)
    super(path, **options.merge(wrap_headers(options)), &block)
  end

  def post(path, options = {}, &block)
    super(path, **json_data(options), &block)
  end

  def patch(path, options = {}, &block)
    super(path, **json_data(options), &block)
  end

  def delete(path, options = {}, &block)
    super(path, **wrap_headers(options), &block)
  end

  def body
    @bodies ||= {}.compare_by_identity
    @bodies[response] ||= begin
      json_body = response.body
      json_body.empty? ? {} : Oj.load(json_body, symbol_keys: true)
    end
  end

  private

  # :reek:FeatureEnvy
  def json_data(options)
    wrap_headers(options)
      .merge(params: options.key?(:params) ? wrap_params(options[:params]) : nil)
      .compact
  end

  def wrap_params(params)
    return unless params
    return params if params.is_a?(String)

    params.to_json
  end

  def wrap_headers(options)
    {
      headers: DEFAULT_HEADERS.merge(options[:headers] || {})
    }
  end
end
