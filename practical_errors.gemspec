# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'practical_errors/version'

Gem::Specification.new do |spec|
  spec.name          = 'practical_errors'
  spec.version       = PracticalErrors::VERSION
  spec.authors       = ['Kazuhiro Serizawa']
  spec.email         = ['nserihiro@gmail.com']

  spec.summary       = 'Make rails error messages more practical.'
  spec.description   = 'Make rails error messages more practical.'
  spec.homepage      = 'https://github.com/serihiro/practical_errors'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'activesupport', '>= 4.0', '<5.0'
  spec.add_runtime_dependency 'error_arranger', '~> 0.1'
end
