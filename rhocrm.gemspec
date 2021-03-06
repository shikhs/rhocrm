# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rhocrm/version"

Gem::Specification.new do |s|
  s.name        = "rhocrm"
  s.version     = Rhocrm::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rhomobile"]
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.email       = %q{dev@rhomobile.com}
  s.homepage    = %q{http://rhomobile.com/products/rhocrm}
  s.summary     = %q{Rhosync CRM adaptors}
  s.description = %q{RhoSync out-of-the box CRM adaptors}

  s.rubyforge_project = nil

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = %q{1.5.0}
  s.extra_rdoc_files = [
    "README.md"
  ]

  s.add_dependency('bundler', '~> 1.0')  
  s.add_dependency('rhosync', '>= 3.0.0')
  s.add_dependency('rake', '~> 0.9.2')
  s.add_dependency('nokogiri', '>= 1.4.6')
end
