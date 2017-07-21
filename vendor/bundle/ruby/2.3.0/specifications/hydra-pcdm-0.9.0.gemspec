# -*- encoding: utf-8 -*-
# stub: hydra-pcdm 0.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hydra-pcdm".freeze
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["E. Lynette Rayle".freeze]
  s.date = "2016-08-31"
  s.description = "Portland Common Data Model (PCDM)".freeze
  s.email = ["elr37@cornell.edu".freeze]
  s.homepage = "https://github.com/projecthydra-labs/hydra-pcdm".freeze
  s.licenses = ["APACHE2".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Portland Common Data Model (PCDM)".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<active-fedora>.freeze, ["< 12", ">= 10"])
      s.add_runtime_dependency(%q<mime-types>.freeze, [">= 1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.1"])
      s.add_development_dependency(%q<solr_wrapper>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<active-fedora>.freeze, ["< 12", ">= 10"])
      s.add_dependency(%q<mime-types>.freeze, [">= 1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.1"])
      s.add_dependency(%q<solr_wrapper>.freeze, ["~> 0.4"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<active-fedora>.freeze, ["< 12", ">= 10"])
    s.add_dependency(%q<mime-types>.freeze, [">= 1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.1"])
    s.add_dependency(%q<solr_wrapper>.freeze, ["~> 0.4"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
