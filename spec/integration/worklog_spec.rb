# rubocop:disable Style/FrozenStringLiteralComment

require 'spec_helper'

describe Tempo::Resource::Worklog do
  with_each_client do |site_url, client|
    let(:client) { client }
    let(:site_url) { site_url }
    let(:find_by_params) { { user: '70121:d947c445-a8f7-42c3-a0c9-fb747131d2c7' } }
    let(:expected_collection_length) { 1 }

    let(:expected_attributes) do
      {
        'self' => 'https://api.tempo.io/core/3/worklogs/2',
        'tempoWorklogId' => 2,
        'jiraWorklogId' => 10_000,
        'issue' => {
          'self' => 'https://vanyavasylyshyn.atlassian.net/rest/api/2/issue/VENX-1',
          'key' => 'VENX-1',
          'id' => 10_000
        },
        'timeSpentSeconds' => 28_800,
        'billableSeconds' => 28_800,
        'startDate' => '2022-05-01',
        'startTime' => '08:00:00',
        'description' => 'Some Test Worklog',
        'createdAt' => '2022-05-01T12:15:38Z',
        'updatedAt' => '2022-05-01T12:15:38Z',
        'author' => {
          'self' => 'https://jira.atlassian.net/rest/api/2/user?accountId=70121:d947c445-a8f7-42c3-a0c9-fb747131d2c7',
          'accountId' => '70121:d947c445-a8f7-42c3-a0c9-fb747131d2c7',
          'displayName' => 'Test User'
        },
        'attributes' => {
          'self' => 'https://api.tempo.io/core/3/worklogs/2/work-attribute-values',
          'values' => []
        }
      }
    end

    it_behaves_like 'a resource'
    it_behaves_like 'a resource with collection GET endpoint by key'
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
