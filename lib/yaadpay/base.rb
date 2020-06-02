require 'active_support/configurable'
require 'active_support/core_ext/object/to_param'
require 'httparty'

module Yaadpay
  class Base
    include ::HTTParty
    debug_output $stderr
    format :json
    def base_url
      Yaadpay.configuration.end_point || 'https://icom.yaad.net/p3/'.freeze
    end
  end
end
