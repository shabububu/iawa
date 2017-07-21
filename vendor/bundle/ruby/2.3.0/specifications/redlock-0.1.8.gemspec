# -*- encoding: utf-8 -*-
# stub: redlock 0.1.8 ruby lib

Gem::Specification.new do |s|
  s.name = "redlock".freeze
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Leandro Moreira".freeze]
  s.date = "2016-05-24"
  s.description = "Distributed lock using Redis written in Ruby. Highly inspired by https://github.com/antirez/redlock-rb.".freeze
  s.email = ["leandro.ribeiro.moreira@gmail.com".freeze]
  s.homepage = "https://github.com/leandromoreira/redlock-rb".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Distributed lock using Redis written in Ruby.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redis>.freeze, [">= 3.0.0", "~> 3"])
      s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.8.13"])
      s.add_development_dependency(%q<rake>.freeze, [">= 11.1.2", "~> 11.1"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.0.0", "~> 3"])
    else
      s.add_dependency(%q<redis>.freeze, [">= 3.0.0", "~> 3"])
      s.add_dependency(%q<coveralls>.freeze, ["~> 0.8.13"])
      s.add_dependency(%q<rake>.freeze, [">= 11.1.2", "~> 11.1"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.0.0", "~> 3"])
    end
  else
    s.add_dependency(%q<redis>.freeze, [">= 3.0.0", "~> 3"])
    s.add_dependency(%q<coveralls>.freeze, ["~> 0.8.13"])
    s.add_dependency(%q<rake>.freeze, [">= 11.1.2", "~> 11.1"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.0.0", "~> 3"])
  end
end
