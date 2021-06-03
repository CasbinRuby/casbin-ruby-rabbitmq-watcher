# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'casbin-ruby-rabbitmq-watcher/version'

Gem::Specification.new do |s|
  s.name     = 'casbin-ruby-rabbitmq-watcher'
  s.version  = CasbinRubyRabbitmqWatcher::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ['Igor Kutyavin', 'Aleksandr Kirillov']
  s.email    = %w[konayre@evrone.com kirillov@evrone.com]
  s.licenses = ['Apache License 2.0']

  s.summary               = 'Redis watcher in Ruby'
  s.description           = 'Redis watcher adapter for Ruby'
  s.homepage              = 'https://github.com/CasbinRuby/casbin-ruby-rabbitmq-watcher'
  s.required_ruby_version = '>= 2.5.0'

  s.files =      %w[README.md] + Dir.glob(File.join('lib', '**', '*.rb'))
  s.test_files = Dir.glob(File.join('spec', '**', '*.rb'))

  s.add_dependency 'bunny'

  s.add_development_dependency 'rspec', '~> 3.10'
  s.add_development_dependency 'rubocop', '>= 1.8'
  s.add_development_dependency 'rubocop-rspec'
end
