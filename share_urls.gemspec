# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "share_urls/version"

Gem::Specification.new do |spec|
  spec.name          = "share_urls"
  spec.version       = ShareUrls::VERSION
  spec.authors       = ["Ravi Prakash"]
  spec.email         = ["raviskit2012@gmail.com"]

  spec.summary       = "Ruby client for Dynamic shareable links"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/raviskit/share_urls"
  spec.license       = "none"
  spec.metadata["yard.run"] = "yri"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dry-configurable", "~> 0.6", ">= 0.6.0"
  spec.add_runtime_dependency "faraday", "~> 0.9", ">= 0.9.2"
  spec.add_runtime_dependency "case_transform2", "~> 1.0", ">= 1.0.0"

  spec.add_development_dependency "bootsnap", "~> 1.3.0"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "dotenv", "~> 2.2", ">= 2.2.2"
  spec.add_development_dependency "pry", "~> 0.11.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", ">= 0.16.1"
  spec.add_development_dependency "vcr", "~> 4.0", ">= 4.0.0"
end
