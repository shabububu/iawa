# -*- encoding: utf-8 -*-
# stub: om 3.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "om".freeze
  s.version = "3.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matt Zumwalt".freeze, "Justin Coyne".freeze]
  s.date = "2016-05-31"
  s.description = "OM (Opinionated Metadata): A library to help you tame sprawling XML schemas like MODS.  Wraps Nokogiri documents in objects with miscellaneous helper methods for doing things like retrieve generated xpath queries or look up properties based on a simplified DSL".freeze
  s.email = "matt.zumwalt@yourmediashelf.com justin.coyne@mediashelf.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze]
  s.files = ["LICENSE".freeze]
  s.homepage = "http://github.com/projecthydra/om".freeze
  s.licenses = ["APACHE2".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "OM (Opinionated Metadata): A library to help you tame sprawling XML schemas like MODS.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<activemodel>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<solrizer>.freeze, ["~> 3.3"])
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.4.2"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_development_dependency(%q<equivalent-xml>.freeze, [">= 0.2.4"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_dependency(%q<activemodel>.freeze, [">= 0"])
      s.add_dependency(%q<solrizer>.freeze, ["~> 3.3"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 1.4.2"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_dependency(%q<equivalent-xml>.freeze, [">= 0.2.4"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<activemodel>.freeze, [">= 0"])
    s.add_dependency(%q<solrizer>.freeze, ["~> 3.3"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 1.4.2"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
    s.add_dependency(%q<equivalent-xml>.freeze, [">= 0.2.4"])
  end
end
