# -*- encoding: utf-8 -*-
# stub: active-fedora 11.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "active-fedora".freeze
  s.version = "11.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matt Zumwalt".freeze, "McClain Looney".freeze, "Justin Coyne".freeze]
  s.date = "2017-06-28"
  s.description = "ActiveFedora provides for creating and managing objects in the Fedora Repository Architecture.".freeze
  s.email = ["matt.zumwalt@yourmediashelf.com".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze]
  s.homepage = "https://github.com/projecthydra/active_fedora".freeze
  s.licenses = ["APACHE2".freeze]
  s.required_ruby_version = Gem::Requirement.new("~> 2.0".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "A convenience libary for manipulating documents in the Fedora Repository.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rsolr>.freeze, ["< 3", ">= 1.1.2"])
      s.add_runtime_dependency(%q<solrizer>.freeze, ["< 5", ">= 3.4"])
      s.add_runtime_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.2.4"])
      s.add_runtime_dependency(%q<activemodel>.freeze, ["< 6", ">= 4.2"])
      s.add_runtime_dependency(%q<active-triples>.freeze, ["~> 0.11.0"])
      s.add_runtime_dependency(%q<deprecation>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<ldp>.freeze, ["~> 0.7.0"])
      s.add_runtime_dependency(%q<ruby-progressbar>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.12.1"])
      s.add_runtime_dependency(%q<faraday-encoding>.freeze, ["= 0.0.4"])
      s.add_development_dependency(%q<rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<solr_wrapper>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_development_dependency(%q<equivalent-xml>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.47.1"])
      s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 1.12.0"])
    else
      s.add_dependency(%q<rsolr>.freeze, ["< 3", ">= 1.1.2"])
      s.add_dependency(%q<solrizer>.freeze, ["< 5", ">= 3.4"])
      s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.2.4"])
      s.add_dependency(%q<activemodel>.freeze, ["< 6", ">= 4.2"])
      s.add_dependency(%q<active-triples>.freeze, ["~> 0.11.0"])
      s.add_dependency(%q<deprecation>.freeze, [">= 0"])
      s.add_dependency(%q<ldp>.freeze, ["~> 0.7.0"])
      s.add_dependency(%q<ruby-progressbar>.freeze, ["~> 1.0"])
      s.add_dependency(%q<faraday>.freeze, ["~> 0.12.1"])
      s.add_dependency(%q<faraday-encoding>.freeze, ["= 0.0.4"])
      s.add_dependency(%q<rails>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<solr_wrapper>.freeze, ["~> 1.0"])
      s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.2"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_dependency(%q<equivalent-xml>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.8"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.47.1"])
      s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.12.0"])
    end
  else
    s.add_dependency(%q<rsolr>.freeze, ["< 3", ">= 1.1.2"])
    s.add_dependency(%q<solrizer>.freeze, ["< 5", ">= 3.4"])
    s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.2.4"])
    s.add_dependency(%q<activemodel>.freeze, ["< 6", ">= 4.2"])
    s.add_dependency(%q<active-triples>.freeze, ["~> 0.11.0"])
    s.add_dependency(%q<deprecation>.freeze, [">= 0"])
    s.add_dependency(%q<ldp>.freeze, ["~> 0.7.0"])
    s.add_dependency(%q<ruby-progressbar>.freeze, ["~> 1.0"])
    s.add_dependency(%q<faraday>.freeze, ["~> 0.12.1"])
    s.add_dependency(%q<faraday-encoding>.freeze, ["= 0.0.4"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<solr_wrapper>.freeze, ["~> 1.0"])
    s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.2"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
    s.add_dependency(%q<equivalent-xml>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.8"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.47.1"])
    s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.12.0"])
  end
end
