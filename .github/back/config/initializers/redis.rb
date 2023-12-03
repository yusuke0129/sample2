# frozen_string_literal: true

require 'redis'

uri = URI.parse('redis:6379')
REDIS = Redis.new(host: uri.host, port: uri.port)

# REDIS = Redis.new(host: 'redis', port: '6379')
