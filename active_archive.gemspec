# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_archive/version'

Gem::Specification.new do |spec|
  spec.name = 'active_archive'
  spec.version = ActiveArchive::VERSION
  spec.authors = ['Juan Gomez']
  spec.email = ['j.gomez@drexed.com']

  spec.summary = 'Gem for soft-deleting ActiveRecord objects.'
  spec.description = 'Prevent database records from being destroyed.'
  spec.homepage = 'https://github.com/drexed/active_archive'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w(lib support)

  spec.add_runtime_dependency 'rails'
  spec.add_runtime_dependency 'dry-configurable'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'fasterer'
  spec.add_development_dependency 'flay'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rubocop'
end
