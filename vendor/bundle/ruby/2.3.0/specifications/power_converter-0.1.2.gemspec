# -*- encoding: utf-8 -*-
# stub: power_converter 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "power_converter".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeremy Friesen".freeze]
  s.date = "2016-09-20"
  s.description = "A lightweight library to define object conversion methods/modules.".freeze
  s.email = ["jeremy.n.friesen@gmail.com".freeze]
  s.homepage = "https://github.com/jeremyf/power_converter".freeze
  s.licenses = ["APACHE2".freeze]
  s.required_ruby_version = Gem::Requirement.new("~> 2.0".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "A lightweight library to define object conversion methods/modules.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.5"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.4"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.5"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.2"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
      s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.4"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.5"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.2"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.4"])
  end
end
