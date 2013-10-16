# encoding: utf-8

require 'rack'
require 'browser'
require 'mobvious'
require 'rack/body_classes/version'

Mobvious.configure do |config|
  config.strategies = [ Mobvious::Strategies::MobileESP.new(:mobile_tablet_desktop) ]
end

module Rack
  class BodyClasses
    def initialize(app)
      @app = app
      @mobvious = Mobvious::Manager.new(app)
    end

    def call(env)
      @mobvious.call(env)
      browser = Browser.new(ua: env["HTTP_USER_AGENT"], accept_language: env['HTTP_ACCEPT_LANGUAGE'])
      env['rack.body_classes'] = [env['mobvious.device_type'], browser.meta].flatten.compact.join(" ")
      status, headers, body = @app.call(env)
      [status, headers, body]
    end
  end
end
