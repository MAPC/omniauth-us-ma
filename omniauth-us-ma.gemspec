# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-us-ma/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-us-ma"
  s.version     = OmniAuth::UsMa::VERSION
  s.authors     = ["Matt Cloyd"]
  s.email       = ["mcloyd@mapc.org"]
  s.homepage    = "https://github.com/MAPC/omniauth-us-ma"
  s.description = %q{OmniAuth strategy for the Commonwealth of Massachusetts}
  s.summary     = s.description
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'json', '~> 1.3'
  s.add_dependency 'omniauth-oauth', '~> 1.1'
  s.add_development_dependency 'bundler', '~> 1.0'
end
