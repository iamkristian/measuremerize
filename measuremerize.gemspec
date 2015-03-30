# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'measuremerize/version'

Gem::Specification.new do |spec|
  spec.name          = "measuremerize"
  spec.version       = Measuremerize::VERSION
  spec.authors       = ["Kristian Rasmussen"]
  spec.email         = ["me@krx.io"]
  spec.summary       = %q{A collection of measuring tools for ruby benchmarks}
  spec.description   = %q{Memory and time measuring for ruby profiling}
  spec.homepage      = "http://github.com/iamkristian/measuremerize"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
