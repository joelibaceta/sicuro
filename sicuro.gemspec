# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'sicuro/version'

Gem::Specification.new do |s|
  s.name        = 'sicuro'
  s.version     = Sicuro::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Marie Markwell']
  s.email       = ['me@marie.so']
  s.homepage    = 'http://github.com/duckinator/sicuro'
  s.summary     = %q{The self-hosting Ruby interpreter.}
  s.description = s.summary

  s.add_runtime_dependency 'standalone', '~> 0.5.0'
  s.add_runtime_dependency 'parser',     '~> 2.1.9'
  s.add_runtime_dependency 'contracts',  '~> 0.4'

  s.add_development_dependency "rake",      '~> 10.2.2'
  s.add_development_dependency 'rspec',     '~> 2.14.0'
  s.add_development_dependency 'simplecov', '~> 0.8.2'
  s.add_development_dependency 'bundler',   '~> 1.6.0'
  s.add_development_dependency 'coveralls'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end

