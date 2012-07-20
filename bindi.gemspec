# -*- encoding: utf-8 -*-
require File.expand_path('../lib/namaste/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Havenwood']
  gem.email         = ['shannonskipper@gmail.com']
  gem.description   = %q{A DSL for saving Ruby Objects to Redis.}
  gem.summary       = %q{Bindi is a DSL that marshals Ruby Objects and saves them to Redis using Ohm.}
  gem.homepage      = 'https://github.com/Havenwood/bindi'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'bindi'
  gem.require_paths = ['lib']
  gem.version       = Namaste::VERSION
  
  gem.add_development_dependency 'ohm'
  gem.add_runtime_dependency 'ohm'
end
