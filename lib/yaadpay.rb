require 'yaadpay/config'
require 'yaadpay/base'
require 'yaadpay/sign'
require 'yaadpay/payment_gateway'
require 'yaadpay/verification'
require 'yaadpay/version'

module Yaadpay
  class Error < StandardError; end

  def configuration
    @configuration ||= Config.new
  end

  def config
    config = configuration
    yield(config)
  end

  module_function :configuration, :config
end
