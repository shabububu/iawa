# -*- encoding: utf-8 -*-
# stub: ld-patch 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "ld-patch".freeze
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gregg Kellogg".freeze]
  s.date = "2016-12-31"
  s.description = "\n    Implements the W3C Linked Data Patch Format and operations for RDF.rb.\n    Makes use of the SPARQL gem for performing updates.".freeze
  s.email = "public-rdf-ruby@w3.org".freeze
  s.homepage = "http://github.com/ruby-rdf/ld-patch".freeze
  s.licenses = ["Unlicense".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubyforge_project = "ld-patch".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "W3C Linked Data Patch Format for RDF.rb.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rdf>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<ebnf>.freeze, [">= 1.0.1", "~> 1.0"])
      s.add_runtime_dependency(%q<sparql>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<sxp>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<rdf-xsd>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<json-ld>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<rack>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rdf-spec>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<open-uri-cached>.freeze, [">= 0.0.5", "~> 0.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 2.3"])
    else
      s.add_dependency(%q<rdf>.freeze, ["~> 2.0"])
      s.add_dependency(%q<ebnf>.freeze, [">= 1.0.1", "~> 1.0"])
      s.add_dependency(%q<sparql>.freeze, ["~> 2.0"])
      s.add_dependency(%q<sxp>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rdf-xsd>.freeze, ["~> 2.0"])
      s.add_dependency(%q<json-ld>.freeze, ["~> 2.0"])
      s.add_dependency(%q<rack>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rdf-spec>.freeze, ["~> 2.0"])
      s.add_dependency(%q<open-uri-cached>.freeze, [">= 0.0.5", "~> 0.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_dependency(%q<webmock>.freeze, ["~> 2.3"])
    end
  else
    s.add_dependency(%q<rdf>.freeze, ["~> 2.0"])
    s.add_dependency(%q<ebnf>.freeze, [">= 1.0.1", "~> 1.0"])
    s.add_dependency(%q<sparql>.freeze, ["~> 2.0"])
    s.add_dependency(%q<sxp>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rdf-xsd>.freeze, ["~> 2.0"])
    s.add_dependency(%q<json-ld>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rack>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rdf-spec>.freeze, ["~> 2.0"])
    s.add_dependency(%q<open-uri-cached>.freeze, [">= 0.0.5", "~> 0.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_dependency(%q<webmock>.freeze, ["~> 2.3"])
  end
end
