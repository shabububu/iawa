# -*- encoding: utf-8 -*-
# stub: redic 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "redic".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michel Martens".freeze, "Cyril David".freeze]
  s.date = "2015-05-12"
  s.description = "Lightweight Redis Client".freeze
  s.email = ["michel@soveran.com".freeze, "cyx@cyx.is".freeze]
  s.homepage = "https://github.com/amakawa/redic".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Lightweight Redis Client".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hiredis>.freeze, [">= 0"])
    else
      s.add_dependency(%q<hiredis>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<hiredis>.freeze, [">= 0"])
  end
end
