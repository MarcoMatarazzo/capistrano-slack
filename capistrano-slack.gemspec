# coding: utf-8

Gem::Specification.new do |gem|
  gem.name          = "capistrano-slack"
  gem.version       = "0.1"
  gem.authors       = ["Marco Matarazzo"]
  gem.email         = ["storm@elemental.it"]
  gem.description   = %q{Simple Capistrano 3 Slack notifier.}
  gem.summary       = %q{Simple Capistrano 3 Slack notifier.}
  gem.homepage      = "https://github.com/MarcoMatarazzo/capistrano-slack"
  gem.license       = "MIT"

  gem.required_ruby_version = '>= 2.1.9'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "capistrano", "~> 3.4"
  gem.add_runtime_dependency "slack-notifier"

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'
end
