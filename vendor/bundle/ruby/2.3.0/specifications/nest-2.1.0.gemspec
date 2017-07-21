# -*- encoding: utf-8 -*-
# stub: nest 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "nest".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michel Martens".freeze]
  s.date = "2016-12-02"
  s.description = "It is a design pattern in key-value databases to use the key to simulate structure, and Nest can take care of that.".freeze
  s.email = ["michel@soveran.com".freeze]
  s.homepage = "http://github.com/soveran/nest".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Object-oriented keys for Redis.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redic>.freeze, [">= 0"])
      s.add_development_dependency(%q<cutest>.freeze, [">= 0"])
    else
      s.add_dependency(%q<redic>.freeze, [">= 0"])
      s.add_dependency(%q<cutest>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<redic>.freeze, [">= 0"])
    s.add_dependency(%q<cutest>.freeze, [">= 0"])
  end
end
