# -*- encoding: utf-8 -*-
# stub: qa 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "qa".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Stephen Anderson".freeze, "Don Brower".freeze, "Jim Coble".freeze, "Mike Dubin".freeze, "Randall Floyd".freeze, "Eric James".freeze, "Mike Stroming".freeze, "Adam Wead".freeze]
  s.date = "2017-06-23"
  s.description = "Provides a set of uniform RESTful routes to query any controlled vocabulary or set of authority terms.".freeze
  s.email = ["amsterdamos@gmail.com".freeze]
  s.homepage = "https://github.com/projecthydra/questioning_authority".freeze
  s.licenses = ["APACHE-2".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "You should question your authorities.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, ["< 6.0", ">= 4.2.0"])
      s.add_runtime_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
      s.add_runtime_dependency(%q<activerecord-import>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<deprecation>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rdf>.freeze, [">= 0"])
      s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
      s.add_development_dependency(%q<linkeddata>.freeze, [">= 0"])
      s.add_development_dependency(%q<engine_cart>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.42.0"])
      s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 1.8.0"])
    else
      s.add_dependency(%q<rails>.freeze, ["< 6.0", ">= 4.2.0"])
      s.add_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
      s.add_dependency(%q<activerecord-import>.freeze, [">= 0"])
      s.add_dependency(%q<deprecation>.freeze, [">= 0"])
      s.add_dependency(%q<rdf>.freeze, [">= 0"])
      s.add_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
      s.add_dependency(%q<linkeddata>.freeze, [">= 0"])
      s.add_dependency(%q<engine_cart>.freeze, ["~> 0.8"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.42.0"])
      s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.8.0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, ["< 6.0", ">= 4.2.0"])
    s.add_dependency(%q<faraday>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.6"])
    s.add_dependency(%q<activerecord-import>.freeze, [">= 0"])
    s.add_dependency(%q<deprecation>.freeze, [">= 0"])
    s.add_dependency(%q<rdf>.freeze, [">= 0"])
    s.add_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
    s.add_dependency(%q<linkeddata>.freeze, [">= 0"])
    s.add_dependency(%q<engine_cart>.freeze, ["~> 0.8"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.42.0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.8.0"])
  end
end
