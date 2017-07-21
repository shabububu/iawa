# -*- encoding: utf-8 -*-
# stub: hydra-core 10.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hydra-core".freeze
  s.version = "10.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matt Zumwalt, Bess Sadler, Julie Meloni, Naomi Dushay, Jessie Keck, John Scofield, Justin Coyne & many more.  See https://github.com/projecthydra/hydra-head/contributors".freeze]
  s.date = "2017-06-09"
  s.description = "Hydra-Head is a Rails Engine containing the core code for a Hydra application. The full hydra stack includes: Blacklight, Fedora, Solr, active-fedora, solrizer, and om".freeze
  s.email = ["hydra-tech@googlegroups.com".freeze]
  s.homepage = "http://projecthydra.org".freeze
  s.licenses = ["APACHE2".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Hydra-Head Rails Engine (requires Rails3)".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, ["< 6", ">= 4.0.0"])
      s.add_runtime_dependency(%q<hydra-access-controls>.freeze, ["= 10.5.0"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8.7"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<factory_girl_rails>.freeze, ["~> 4.2"])
    else
      s.add_dependency(%q<railties>.freeze, ["< 6", ">= 4.0.0"])
      s.add_dependency(%q<hydra-access-controls>.freeze, ["= 10.5.0"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8.7"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
      s.add_dependency(%q<factory_girl_rails>.freeze, ["~> 4.2"])
    end
  else
    s.add_dependency(%q<railties>.freeze, ["< 6", ">= 4.0.0"])
    s.add_dependency(%q<hydra-access-controls>.freeze, ["= 10.5.0"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8.7"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
    s.add_dependency(%q<factory_girl_rails>.freeze, ["~> 4.2"])
  end
end
