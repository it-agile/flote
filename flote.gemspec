Gem::Specification.new do |s|
   s.version = "0.0.2"
   s.date = %q{2012-01-16}
   s.name = %q{flote}
   s.authors = ["CodersDojo-Team"]
   s.email = %q{codersdojo@it-agile.de}
   s.summary = %q{flote (Flow Tester) is a continuous testing tool for any programming language.}
   s.homepage = %q{http://www.codersdojo.org/}
   s.description = %q{flote executes tests in an endless loop.}
   s.files = Dir["lib/**/*"]
   s.rubyforge_project = 'flote'
   s.has_rdoc = true
   s.test_files = Dir['spec/*']
   s.executables = ['flote']
   s.required_ruby_version = '>= 1.8.6'
   s.add_dependency('term-ansicolor', '>= 1.0.5')
   s.add_dependency('shell-utils', '= 0.1.1')
end
