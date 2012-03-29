$:.push File.expand_path("../lib", __FILE__)
require "qwik_doc"

Gem::Specification.new do |s|
  s.name        = "qwikdoc"
  s.version     = QwikDoc::VERSION
  s.authors     = ["Koji Shimada"]
  s.email       = ["koji.shimada@enishi-tech.com"]
  s.homepage    = "https://github.com/snoozer05/qwikdoc"
  s.summary     = %q{text-to-HTML conversion tool for qwikWeb users}
  s.description = %q{text-to-HTML conversion tool for qwikWeb users}

  s.rubyforge_project = "qwikdoc"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 1.9.2'

  s.add_runtime_dependency 'bundler', ['>= 1.0']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
