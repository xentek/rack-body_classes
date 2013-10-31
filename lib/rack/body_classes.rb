# encoding: utf-8

require 'rack'
require 'browser'
require 'mobileesp_converted'
require 'rack/body_classes/version'

module Rack
  class BodyClasses
    def initialize(app)
      @app = app
    end

    def call(env)
      browser = Browser.new(ua: env["HTTP_USER_AGENT"], accept_language: env['HTTP_ACCEPT_LANGUAGE']).meta
      device = mobile_esp(env["HTTP_USER_AGENT"], env['HTTP_ACCEPT'])
      env['rack.body_classes'] = [device, browser].flatten.compact.join(" ")
      status, headers, body = @app.call(env)
      [status, headers, body]
    end

    private

    def mobile_esp(user_agent, http_accept)
      return 'unknown-device' if user_agent.nil? || http_accept.nil?
      mobileesp = MobileESPConverted::UserAgentInfo.new(user_agent, http_accept)
      return :mobile if mobileesp.is_tier_generic_mobile || mobileesp.is_tier_iphone || mobileesp.is_tier_rich_css
      return :tablet if mobileesp.is_tier_tablet
      return :desktop
    end      
  end
end
