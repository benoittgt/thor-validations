# frozen_string_literal: true

require_relative "lib/thor/validations/version"

Gem::Specification.new do |spec|
  spec.name = "thor-validations"
  spec.version = Thor::Validations::VERSION
  spec.authors = ["Benoit Tigeot"]
  spec.email = ["benoit.tigeot@gmail.com"]

  spec.summary = "Adds validate_before functionality to Thor commands"
  spec.description = "A simple gem that adds a validate_before method to Thor, allowing pre-command validations"
  spec.homepage = "https://github.com/benoittgt/thor-validations"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/benoittgt/thor-validations"
  spec.metadata["changelog_uri"] = "https://github.com/benoittgt/thor-validations/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob(%w[lib/**/*.rb [A-Z]*.md [A-Z]*.txt])
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", '~> 1.3', '>= 1.3.1'

  spec.add_development_dependency "minitest", '~> 5.24', '>= 5.24.1'
end
