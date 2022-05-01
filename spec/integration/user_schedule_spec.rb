# rubocop:disable Style/FrozenStringLiteralComment

require 'spec_helper'

describe Tempo::Resource::UserSchedule do
  with_each_client do |site_url, client|
    let(:client) { client }
    let(:site_url) { site_url }

    it_behaves_like 'a resource'
    # it_behaves_like 'a resource with collection GET endpoint by key'
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
