# -*- encoding: utf-8 -*-
# stub: hydra-works 0.16.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hydra-works".freeze
  s.version = "0.16.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Justin Coyne".freeze]
  s.date = "2017-03-02"
  s.description = "Using this data model should enable easy collaboration amongst hydra projects.".freeze
  s.email = ["justin@curationexperts.com".freeze]
  s.homepage = "https://github.com/projecthydra-labs/hydra-works".freeze
  s.licenses = ["APACHE2".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Fundamental repository data model for hydra".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hydra-pcdm>.freeze, [">= 0.9"])
      s.add_runtime_dependency(%q<hydra-derivatives>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<hydra-file_characterization>.freeze, [">= 0.3.3", "~> 0.3"])
      s.add_runtime_dependency(%q<om>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<solr_wrapper>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.1"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<hydra-pcdm>.freeze, [">= 0.9"])
      s.add_dependency(%q<hydra-derivatives>.freeze, ["~> 3.0"])
      s.add_dependency(%q<hydra-file_characterization>.freeze, [">= 0.3.3", "~> 0.3"])
      s.add_dependency(%q<om>.freeze, ["~> 3.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<solr_wrapper>.freeze, ["~> 0.4"])
      s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.1"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<hydra-pcdm>.freeze, [">= 0.9"])
    s.add_dependency(%q<hydra-derivatives>.freeze, ["~> 3.0"])
    s.add_dependency(%q<hydra-file_characterization>.freeze, [">= 0.3.3", "~> 0.3"])
    s.add_dependency(%q<om>.freeze, ["~> 3.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.1"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<solr_wrapper>.freeze, ["~> 0.4"])
    s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.1"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
