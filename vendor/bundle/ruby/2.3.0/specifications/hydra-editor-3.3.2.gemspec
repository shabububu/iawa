# -*- encoding: utf-8 -*-
# stub: hydra-editor 3.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "hydra-editor".freeze
  s.version = "3.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Justin Coyne".freeze, "David Chandek-Stark".freeze]
  s.date = "2017-05-23"
  s.description = "A basic metadata editor for hydra-head".freeze
  s.email = ["hydra-tech@googlegroups.com".freeze]
  s.homepage = "http://github.com/projecthydra/hydra-editor".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "A basic metadata editor for hydra-head".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, ["< 6", ">= 4.2.0"])
      s.add_runtime_dependency(%q<active-fedora>.freeze, [">= 9.0.0"])
      s.add_runtime_dependency(%q<cancancan>.freeze, ["~> 1.8"])
      s.add_runtime_dependency(%q<simple_form>.freeze, ["~> 3.2"])
      s.add_runtime_dependency(%q<sprockets-es6>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<almond-rails>.freeze, ["~> 0.1"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<rails-controller-testing>.freeze, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>.freeze, ["~> 4.2"])
      s.add_development_dependency(%q<capybara>.freeze, ["~> 2.4"])
      s.add_development_dependency(%q<devise>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<hydra-head>.freeze, [">= 9.0"])
      s.add_development_dependency(%q<engine_cart>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<solr_wrapper>.freeze, ["~> 0.15"])
      s.add_development_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.5"])
      s.add_development_dependency(%q<jasmine>.freeze, ["~> 2.3"])
    else
      s.add_dependency(%q<rails>.freeze, ["< 6", ">= 4.2.0"])
      s.add_dependency(%q<active-fedora>.freeze, [">= 9.0.0"])
      s.add_dependency(%q<cancancan>.freeze, ["~> 1.8"])
      s.add_dependency(%q<simple_form>.freeze, ["~> 3.2"])
      s.add_dependency(%q<sprockets-es6>.freeze, [">= 0"])
      s.add_dependency(%q<almond-rails>.freeze, ["~> 0.1"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
      s.add_dependency(%q<rails-controller-testing>.freeze, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>.freeze, ["~> 4.2"])
      s.add_dependency(%q<capybara>.freeze, ["~> 2.4"])
      s.add_dependency(%q<devise>.freeze, ["~> 4.0"])
      s.add_dependency(%q<hydra-head>.freeze, [">= 9.0"])
      s.add_dependency(%q<engine_cart>.freeze, ["~> 1.0"])
      s.add_dependency(%q<solr_wrapper>.freeze, ["~> 0.15"])
      s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.5"])
      s.add_dependency(%q<jasmine>.freeze, ["~> 2.3"])
    end
  else
    s.add_dependency(%q<rails>.freeze, ["< 6", ">= 4.2.0"])
    s.add_dependency(%q<active-fedora>.freeze, [">= 9.0.0"])
    s.add_dependency(%q<cancancan>.freeze, ["~> 1.8"])
    s.add_dependency(%q<simple_form>.freeze, ["~> 3.2"])
    s.add_dependency(%q<sprockets-es6>.freeze, [">= 0"])
    s.add_dependency(%q<almond-rails>.freeze, ["~> 0.1"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
    s.add_dependency(%q<rails-controller-testing>.freeze, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>.freeze, ["~> 4.2"])
    s.add_dependency(%q<capybara>.freeze, ["~> 2.4"])
    s.add_dependency(%q<devise>.freeze, ["~> 4.0"])
    s.add_dependency(%q<hydra-head>.freeze, [">= 9.0"])
    s.add_dependency(%q<engine_cart>.freeze, ["~> 1.0"])
    s.add_dependency(%q<solr_wrapper>.freeze, ["~> 0.15"])
    s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.5"])
    s.add_dependency(%q<jasmine>.freeze, ["~> 2.3"])
  end
end
