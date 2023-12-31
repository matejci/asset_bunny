# frozen_string_literal: true

require_relative 'lib/asset_bunny/version'

Gem::Specification.new do |spec|
  spec.name          = 'asset_bunny'
  spec.version       = AssetBunny::VERSION
  spec.authors       = ['Matej Cica']
  spec.email         = ['ciloid@gmail.com']

  spec.summary       = 'Wrapper for Bunny gem'
  spec.description   = 'This gem is a simple wrapper around Bunny gem. It allows you to publish messages to RabbitMQ'
  spec.homepage      = 'https://github.com/AssetPandaLLC/asset_bunny'
  spec.license       = 'MIT'
  # spec.required_ruby_version = Gem::Requirement.new('>= 2.7.1')

  spec.metadata['allowed_push_host'] = 'https://github.com/AssetPandaLLC/asset_bunny'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/AssetPandaLLC/asset_bunny'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'bunny', '>= 2.17.0'

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry-byebug', '~> 3.6'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.7'
  spec.add_development_dependency 'rubocop-performance'
end
