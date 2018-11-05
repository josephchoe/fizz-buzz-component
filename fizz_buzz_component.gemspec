# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'fizz_buzz_component'
  s.version = '0.0.0'
  s.summary = 'Fizz Buzz Component'
  s.description = ' '

  s.authors = ['Nathan Ladd']
  s.email = 'nathanladd@gmail.com'
  s.homepage = 'https://github.com/ntl/fizz-buzz-component'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.5.0'

  s.add_runtime_dependency 'eventide-postgres'
  s.add_runtime_dependency 'evt-try'

  s.add_development_dependency 'test_bench'
end
