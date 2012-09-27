# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rsgrep/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sam Rose"]
  gem.email         = ["samwho@lbak.co.uk"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rsgrep"
  gem.require_paths = ["lib"]
  gem.version       = Rsgrep::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-core'
end
