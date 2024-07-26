# frozen_string_literal: true

require_relative "lib/thor/validations/version"

Gem::Specification.new do |spec|
  spec.name = "thor-validations"
  spec.version = Thor::Validations::VERSION
  spec.authors = ["Benoit Tigeot"]
  spec.email = ["benoit.tigeot@lifen.fr"]

  spec.summary = "Adds validate_before functionality to Thor commands"
  spec.description = "A simple gem that adds a validate_before method to Thor, allowing pre-command validations"
  spec.homepage = "https://github.com/benoittgt/thor-validations"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/benoittgt/thor-validations"
  spec.metadata["changelog_uri"] = "https://github.com/benoittgt/thor-validations/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", ">= 0.19.1"
end

