# encoding: utf-8

ENV['RACK_ENV'] = 'test'

lib_path = File.expand_path('../../lib', __FILE__)
($:.unshift lib_path) unless ($:.include? lib_path)

Bundler.setup(:default, ENV['RACK_ENV'])

require 'rack/body_classes'

require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

require 'rack/test'
include Rack::Test::Methods

require 'sinatra/base'
class App < Sinatra::Base
  use Rack::BodyClasses

  get '/' do
    %Q{<html><head></head><body class="#{env['rack.body_classes']}"></body></html>}
  end
end

def app
  App.new
end
