require File.expand_path("../lib/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name    = 'jister'
  gem.version = Jister::VERSION
  gem.date    = Date.today.to_s
  gem.executables << 'jister'

  gem.summary = "Gist an entire project back and forth"
  gem.description = "Use jister to push and pull an entire project from Github's gists! It's great for sharing a project while debugging an issue..."

  gem.authors  = ['Darío Javier Cravero']
  gem.email    = 'dario@uxtemple.com'
  gem.homepage = 'http://github.com/dariocravero/jister'

  gem.add_dependency('rake')
  gem.add_dependency('thor')
  gem.add_dependency('jist')

  # ensure the gem is built out of versioned files
  gem.files = Dir['{bin,lib}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end
