require 'active_support/configurable'
require 'active_support/core_ext/object/to_param'

module Yaadpay
  class Verification < Base
    def initialize(params={})
      @params = params.merge(
        'action' => 'APISign',
        'What' => 'VERIFY',
        'Masof' => Yaadpay.configuration.masof,
        'KEY' => Yaadpay.configuration.api_key,
        'PassP' => Yaadpay.configuration.pass_p,
        )
    end

    def valid?
      response = self.class.get(base_url, query: @params).body.strip
      params = URI.decode_www_form(response).to_h
      params['CCode']=='0'
    end
  end
end

