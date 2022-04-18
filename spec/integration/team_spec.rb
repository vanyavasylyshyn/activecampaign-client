# rubocop:disable Style/FrozenStringLiteralComment

require 'spec_helper'

describe Tempo::Resource::Team do
  with_each_client do |site_url, client|
    let(:client) { client }
    let(:site_url) { site_url }

    let(:expected_attributes) do
      {
        'self' => 'https://api.tempo.io/core/3/teams/2',
        'id' => 2,
        'name' => 'Project 1',
        'summary' => '',
        'lead' => nil,
        'program' => nil,
        'links' => {
          'self' => 'https://api.tempo.io/core/3/teams/2/links'
        },
        'members' => {
          'self' => 'https://api.tempo.io/core/3/teams/2/members'
        },
        'permissions' => {
          'self' => 'https://api.tempo.io/core/3/teams/2/permissions'
        }
      }
    end

    let(:expected_member_attributes) do
      {
        'self' => 'https://api.tempo.io/core/3/teams/2/members/70121:d947c445-a8f7-42c3-a0c9-fb747131d2c7',
        'team' => {
          'self' => 'https://api.tempo.io/core/3/teams/2'
        },
        'member' => {
          'self' => 'https://jira.atlassian.net/rest/api/2/user?accountId=70121:d947c445-a8f7-42c3-a0c9-fb747131d2c7',
          'accountId' => '70121:d947c445-a8f7-42c3-a0c9-fb747131d2c7',
          'displayName' => 'Test User'
        },
        'memberships' => {
          'self' => 'https://api.tempo.io/core/3/teams/2/members/70121:d947c445-a8f7-42c3-a0c9-fb747131d2c7/memberships',
          'active' => {
            'self' => 'https://api.tempo.io/core/3/team-memberships/2',
            'id' => 2,
            'commitmentPercent' => 100,
            'from' => nil,
            'to' => nil,
            'role' => {
              'self' => 'https://api.tempo.io/core/3/roles/2',
              'id' => 2,
              'name' => 'Member'
            }
          }
        }
      }
    end

    let(:expected_collection_length) { 1 }

    it_behaves_like 'a resource'
    it_behaves_like 'a resource with a collection GET endpoint'

    describe 'members' do
      it 'returns all the members' do
        stub_request(:get, "#{site_url}/core/3/teams/1/members")
          .to_return(status: 200, body: get_mock_response('team_members.json'))
        subject = client.Team.build('id' => 1)
        members = subject.members
        expect(members.length).to eq(1)
        members.each do |member|
          expect(member.class).to eq(Tempo::Resource::TeamMember)
          expect(member).not_to be_expanded
          expect(member).to have_attributes(expected_member_attributes)
        end
      end
    end
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
