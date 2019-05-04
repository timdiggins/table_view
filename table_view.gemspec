# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "table_view/version"

Gem::Specification.new do |spec|
  spec.name          = "table_view"
  spec.version       = TableView::VERSION
  spec.authors       = ["Tim Diggins"]
  spec.email         = ["tim@red56.uk"]

  spec.summary       = %q(A wrapper to allow tabular data to be returned in various output formats)
  spec.description   = %q(
    TableView provides easy tools
  )
  spec.homepage      = "https://github.com/timdiggins/table_view"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "0.68.1"
end
