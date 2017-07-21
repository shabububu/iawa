# -*- encoding: utf-8 -*-
# stub: kaminari_route_prefix 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "kaminari_route_prefix".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Beer".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-03-03"
  s.description = "Upstream pull request: https://github.com/amatsuda/kaminari/pull/636".freeze
  s.email = ["cabeer@stanford.edu".freeze]
  s.homepage = "https://github.com/cbeer/kaminari_route_prefix".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Monkey-patch kaminari to work well with Rails engines".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<kaminari>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<railties>.freeze, [">= 0"])
      s.add_development_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
    else
      s.add_dependency(%q<kaminari>.freeze, ["~> 1.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
      s.add_dependency(%q<railties>.freeze, [">= 0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<kaminari>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
    s.add_dependency(%q<railties>.freeze, [">= 0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
  end
end
