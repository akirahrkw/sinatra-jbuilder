# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Akira Hirakawa"]
  gem.email         = ["akirahrkw@gmail.com"]
  gem.summary       = %q{jbuilder for sinatra}
  gem.description   = %q{jbuilder for sinatra}
  gem.homepage      = "http://akirahrkw.com"
  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sinatra-jbuilder"
  gem.require_paths = ["lib"]
  gem.version       = "1.0"
  gem.license       = "MIT"

  gem.add_dependency "sinatra", '~> 1.4', '>= 1.4.0'
  gem.add_dependency "multi_json"

  gem.add_development_dependency "rspec", "~> 2.3"
end