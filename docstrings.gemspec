# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docstrings/version'

Gem::Specification.new do |spec|
  spec.name          = "docstrings"
  spec.version       = DocStrings::VERSION
  spec.authors       = ["Jack Chen (chendo)"]
  spec.email         = ["gems+docstrings@chen.do"]
  spec.description   = %q{docstrings is a gem that adds the ability to use Python-like docstrings}
  spec.summary       = %q{docstrings allows you to define and access docstrings on methods in Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "method_source", "~> 0.8"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
