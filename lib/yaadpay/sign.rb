require 'active_support/configurable'
require 'active_support/core_ext/object/to_param'


module Yaadpay
  class Sign < Base
    def initialize(**params)
      @params = params.merge(
        'action' => 'APISign',
        'What' => 'SIGN',
        'Masof' => Yaadpay.configuration.masof,
        'KEY' => Yaadpay.configuration.api_key,
        'PassP' => Yaadpay.configuration.pass_p,
      )
    end

    def call
      self.class.get(base_url, {query: @params}).body
    end
  end
end
