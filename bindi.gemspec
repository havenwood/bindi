# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bindi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Shannon Skipper']
  gem.email         = ['shannonskipper@gmail.com']
  gem.description   = %q{Persist your Ruby objects in Redis.}
  gem.summary       = %q{Serialize and store Ruby object in Redis.}
  gem.homepage      = 'https://github.com/havenwood/bindi#readme'
  gem.license       = 'MIT'
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'bindi'
  gem.require_paths = ['lib']
  gem.version       = Bindi::VERSION

  gem.add_runtime_dependency 'redis'
end
