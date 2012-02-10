# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "to_js/version"

Gem::Specification.new do |s|
  s.name        = "to_js"
  s.version     = ToJs::VERSION
  s.authors     = ["Dmitriy Kiriyenko, Maxim Tsaplin"]
  s.email       = ["dmitriy.kiriyenko@anahoret.com, maxim.tsaplin@anahoret.com"]
  s.homepage    = ""
  s.summary     = %q{Adds to_js to basic ruby types}
  s.description = %q{Adds to_js to basic ruby types. Use when you need js, not json.}

  s.rubyforge_project = "to_js"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "pry"
  s.add_development_dependency "pry-doc"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

  s.add_runtime_dependency "visitor"
end
