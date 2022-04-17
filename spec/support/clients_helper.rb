# frozen_string_literal: true

def with_each_client(&block)
  clients = {}

  basic_client = Tempo::Client.new(api_key: 'key', auth_type: :api_key)
  clients['http://api.tempo.io'] = basic_client

  clients.each(&block)
end
