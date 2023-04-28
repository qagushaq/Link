# frozen_string_literal: true

# JSON API error representation
# :reek:FeatureEnvy
class Presenters::RequestErrorPresenter
  def call(error)
    [
      {
        title: error.title,
        code: error.code,
        status: error.status,
        source: source(error.field)
      }
    ]
  end

  private

  def source(field)
    return nil unless field

    { pointer: "/data/attributes/#{field}" }
  end
end
