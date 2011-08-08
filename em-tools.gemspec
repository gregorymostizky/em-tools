# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "em-tools/version"

Gem::Specification.new do |s|
  s.name        = "em-tools"
  s.version     = EventMachine::Tools::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gregory Mostizky"]
  s.email       = ["gregory.mostizky@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A bunch of tools that simplify/enhance working with EventMachine}
  s.description = %q{A bunch of tools that simplify/enhance working with EventMachine}

  s.rubyforge_project = "em-tools"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('eventmachine')
  s.add_dependency('em-synchrony')
  s.add_dependency('async_sinatra')
end
