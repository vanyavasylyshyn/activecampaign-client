# frozen_string_literal: true

require 'json'
require 'forwardable'
require 'ostruct'

module Tempo
  # This class is the main access point for all Tempo::resource instances.
  #
  # The client must be initialized with an options hash containing
  # configuration options. The available options are:
  #
  #   :site               => 'http://localhost:2990',
  #   :api_key            => 'api_key_from_tempo'
  #   :context_path       => '/',
  #   :rest_base_path     => "/core/3",
  #   :default_headers    => {},
  #   :read_timeout       => nil,
  #   :http_debug         => false,
  #
  # See the Tempo::Base class methods for all of the available methods on these accessor
  # objects.

  class Client
    extend Forwardable

    # The configuration options for this client instance
    attr_reader :options

    # TODO: MAke sure it's needed
    def_delegators :@request_client, :init_access_token, :set_access_token, :set_request_token, :request_token, :access_token, :authenticated?

    DEFINED_OPTIONS = %i[
      site
      api_key
      auth_type
      context_path
      rest_base_path
      default_headers
      read_timeout
      http_debug
      issuer
      base_url
    ].freeze

    DEFAULT_OPTIONS = {
      site: 'http://api.tempo.io',
      context_path: '/',
      rest_base_path: 'core/3',
      auth_type: :api_key,
      api_key: '',
      http_debug: false,
      default_headers: {}
    }.freeze

    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge(options)
      @options = options
      @options[:rest_base_path] = @options[:context_path] + @options[:rest_base_path]

      unknown_options = options.keys.reject { |o| DEFINED_OPTIONS.include?(o) }
      raise ArgumentError, "Unknown option(s) given: #{unknown_options}" unless unknown_options.empty?

      case options[:auth_type]
      when :api_key
        @request_client = HttpClient.new(@options)
      else
        raise ArgumentError, 'Options: ":auth_type" must be ":oauth",":oauth_2legged", ":cookie" or ":basic"'
      end

      @http_debug = @options[:http_debug]
      @options.freeze
      # @cache = OpenStruct.new
    end

    def Team # :nodoc:
      Tempo::Resource::TeamFactory.new(self)
    end

    def TeamMember # :nodoc:
      Tempo::Resource::TeamMemberFactory.new(self)
    end

    # HTTP methods without a body
    def delete(path, headers = {})
      request(:delete, path, nil, merge_default_headers(headers))
    end

    def get(path, headers = {})
      request(:get, path, nil, merge_default_headers(headers))
    end

    def head(path, headers = {})
      request(:head, path, nil, merge_default_headers(headers))
    end

    # HTTP methods with a body
    def post(path, body = '', headers = {})
      headers = { 'Content-Type' => 'application/json' }.merge(headers)
      request(:post, path, body, merge_default_headers(headers))
    end

    def post_multipart(path, file, headers = {})
      puts "post multipart: #{path} - [#{file}]" if @http_debug
      @request_client.request_multipart(path, file, headers)
    end

    def put(path, body = '', headers = {})
      headers = { 'Content-Type' => 'application/json' }.merge(headers)
      request(:put, path, body, merge_default_headers(headers))
    end

    # Sends the specified HTTP request to the REST API through the
    # appropriate method (oauth, basic).
    def request(http_method, path, body = '', headers = {})
      puts "#{http_method}: #{path} - [#{body}]" if @http_debug
      @request_client.request(http_method, path, body, headers)
    end

    # Stops sensitive client information from being displayed in logs
    def inspect
      "#<Tempo::Client:#{object_id}>"
    end

    protected

    def merge_default_headers(headers)
      { 'Accept' => 'application/json' }.merge(@options[:default_headers]).merge(headers)
    end
  end
end
