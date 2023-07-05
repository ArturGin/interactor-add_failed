# frozen_string_literal: true

require_relative "lib/interactor/add_failed/version"

Gem::Specification.new do |spec|
  spec.name          = "interactor-add_failed"
  spec.version       = Interactor::AddFailed::VERSION
  spec.authors       = ["Artur Gin"]
  spec.email         = ["art.rad.gin@proton.me"]

  spec.summary       = "See which interactor failed"
  spec.description   = <<~DESC
    Interactors are service objects which do one thing and can be strung together.
    The problem this gem is solving is how to check which interactor has failed 
    when the error message is not obvious
  DESC
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.metadata = {
    'changelog_uri' => 'https://github.com/ArturGin/interactor-add_failed/blob/master/CHANGELOG.md',
    'documentation_uri' => 'https://github.com/ArturGin/interactor-add_failed',
    'source_code_uri' => 'https://github.com/ArturGin/interactor-add_failed'
  }

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'interactor', '~> 3'
end
