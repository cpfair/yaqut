# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaqut/version'

Gem::Specification.new do |spec|
  spec.name          = "yaqut"
  spec.version       = Yaqut::VERSION
  spec.authors       = ["Collin"]
  spec.email         = ["collin@remind101.com"]
  spec.summary       = "Look up language names and ISO codes."
  spec.description   = "A lightweight database of language names and ISO codes."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
