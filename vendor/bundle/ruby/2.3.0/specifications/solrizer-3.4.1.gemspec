# -*- encoding: utf-8 -*-
# stub: solrizer 3.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "solrizer".freeze
  s.version = "3.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matt Zumwalt".freeze]
  s.date = "2017-01-05"
  s.description = "Use solrizer to populate solr indexes.  You can run solrizer from within your app, using the provided rake tasks, or as a JMS listener".freeze
  s.email = "hydra-tech@googlegroups.com".freeze
  s.executables = ["solrizer".freeze, "solrizerd".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "bin/solrizer".freeze, "bin/solrizerd".freeze]
  s.homepage = "http://github.com/projecthydra/solrizer".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "A utility for building solr indexes, usually from Fedora repository content with solrizer-fedora extension gem.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<xml-simple>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<stomp>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<daemons>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<RedCloth>.freeze, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_dependency(%q<xml-simple>.freeze, [">= 0"])
      s.add_dependency(%q<stomp>.freeze, [">= 0"])
      s.add_dependency(%q<daemons>.freeze, [">= 0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<RedCloth>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<xml-simple>.freeze, [">= 0"])
    s.add_dependency(%q<stomp>.freeze, [">= 0"])
    s.add_dependency(%q<daemons>.freeze, [">= 0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<RedCloth>.freeze, [">= 0"])
  end
end
