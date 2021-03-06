# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arango_i18n/version'

Gem::Specification.new do |spec|
  spec.name          = "arango_i18n"
  spec.version       = ArangoI18n::VERSION
  spec.authors       = ["Mike Williamson"]
  spec.email         = ["mike@korora.ca"]

  spec.summary       = "Use ArangoDB as your I18n backend."
  spec.description   = "Use the multi-modal ArangoDB as your I18n backend."
  spec.homepage      = "http://github.com/sleepycat/arango_i18n"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ashikawa-core", "~> 0.14.0"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
