# frozen_string_literal: true

RSpec.describe ShortLinks::ShowInput do
  it_behaves_like 'with required attributes', :short_link, %i[url]
  it_behaves_like 'with url attributes', :short_link, %i[url]
end
