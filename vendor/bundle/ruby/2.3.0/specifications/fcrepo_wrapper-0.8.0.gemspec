# -*- encoding: utf-8 -*-
# stub: fcrepo_wrapper 0.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fcrepo_wrapper".freeze
  s.version = "0.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Beer".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-01-25"
  s.email = ["chris@cbeer.info".freeze]
  s.executables = ["fcrepo_wrapper".freeze]
  s.files = ["exe/fcrepo_wrapper".freeze]
  s.homepage = "https://github.com/cbeer/fcrepo_wrapper".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Solr 5 service wrapper".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-progressbar>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<simple_solr_client>.freeze, [">= 0"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
    else
      s.add_dependency(%q<ruby-progressbar>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<simple_solr_client>.freeze, [">= 0"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<ruby-progressbar>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<simple_solr_client>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
  end
end
