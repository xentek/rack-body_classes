# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'rack/body_classes/version'

Gem::Specification.new do |gem|
  gem.name          = 'rack-body_classes'
  gem.version       = Rack::BodyClasses::VERSION
  gem.authors       = ['Eric Marden']
  gem.email         = ['eric@xentek.net']
  gem.description   = %q{Decorate your <body> with CSS Classes indicating platform, browser, browser version, and more.}
  gem.summary       = %q{Decorate your <body> with CSS Classes}
  gem.homepage      = ''
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'rack'
  gem.add_dependency 'browser'
  gem.add_dependency 'mobvious'

  gem.add_development_dependency 'bundler', '~> 1.3'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'gem-release'
end
