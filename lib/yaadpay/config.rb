require 'active_support/configurable'

module Yaadpay
  class Config
    include ::ActiveSupport::Configurable

    config_accessor :end_point, :masof, :pass_p, :api_key

    def initialize(options = {})
      options.each do |key, value|
        config.send("#{key}=", value)
      end
    end
  end
end

