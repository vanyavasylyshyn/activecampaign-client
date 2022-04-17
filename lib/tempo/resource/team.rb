# frozen_string_literal: true

module Tempo
  module Resource
    class TeamFactory < Tempo::BaseFactory; end

    class Team < Tempo::Base
      def self.singular_path(client, key, prefix = '/')
        collection_path(client, prefix) + key
      end

      def members(params = {})
        path = path_base(client) + "teams/#{id}/members"
        response = client.get(url_with_query_params(path, params))
        json = self.class.parse_json(response.body)
        results = json['results']

        results.map { |issue| client.TeamMember.build(issue) }
      end
    end
  end
end
