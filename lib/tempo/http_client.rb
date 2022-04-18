# frozen_string_literal: true

require 'json'
require 'net/https'
require 'cgi/cookie'
require 'uri'

module Tempo
  class HttpClient < RequestClient
    def initialize(options)
      @options = { Authorization: "Bearer #{options.delete(:api_key)}" }.merge(options)
      @cookies = {}
    end

    def make_request(http_method, url, body = '', headers = {})
      # When a proxy is enabled, Net::HTTP expects that the request path omits the domain name
      path = request_path(url)
      request = Net::HTTP.const_get(http_method.to_s.capitalize).new(path, headers)
      request.body = body unless body.nil?

      execute_request(request)
    end

    def basic_auth_http_conn
      http_conn(uri)
    end

    def http_conn(uri)
      http_conn = Net::HTTP.new(uri.host, uri.port)
      http_conn.use_ssl = false
      http_conn.read_timeout = @options[:read_timeout]
      http_conn
    end

    def uri
      URI.parse(@options[:site])
    end

    def authenticated?
      @authenticated
    end

    private

    def execute_request(request)
      response = basic_auth_http_conn.request(request)
      @authenticated = response.is_a? Net::HTTPOK
      store_cookies(response) if options[:use_cookies]

      response
    end

    def request_path(url)
      parsed_uri = URI(url)

      return url unless parsed_uri.is_a?(URI::HTTP)

      parsed_uri.request_uri
    end
  end
end
