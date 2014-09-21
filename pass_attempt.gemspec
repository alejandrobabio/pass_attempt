# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pass_attempt/version'

Gem::Specification.new do |spec|
  spec.name          = "pass_attempt"
  spec.version       = PassAttempt::VERSION
  spec.authors       = ["Alejandro Babio\n"]
  spec.email         = ["alejandro.e.babio@hotmail.com"]
  spec.summary       = %q{PassAttempt run a block depending on a custom proc.}
  spec.description   = %q{PassAttempt run a block depending on a custom proc.}
  spec.homepage      = "https://github.com/alejandrobabio/pass_attempt"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
