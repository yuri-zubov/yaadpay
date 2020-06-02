require 'active_support/configurable'
require 'active_support/core_ext/object/to_param'

module Yaadpay
  class PaymentGateway < Base
    def initialize(**params)
      encoded_params = Sign.new(**params).call
      @params = URI.decode_www_form(encoded_params).to_h
      @params.merge!("action" => 'pay')
    end

    def call
      "#{base_url}?#{@params.to_param}"
    end
  end
end

