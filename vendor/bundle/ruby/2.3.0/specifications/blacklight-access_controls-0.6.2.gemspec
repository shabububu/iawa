# -*- encoding: utf-8 -*-
# stub: blacklight-access_controls 0.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "blacklight-access_controls".freeze
  s.version = "0.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Beer".freeze, "Justin Coyne".freeze, "Matt Zumwalt".freeze, "Valerie Maher".freeze]
  s.date = "2017-03-28"
  s.description = "Access controls for blacklight-based applications".freeze
  s.email = ["blacklight-development@googlegroups.com".freeze]
  s.homepage = "https://github.com/projectblacklight/blacklight-access_controls".freeze
  s.licenses = ["APACHE2".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Access controls for blacklight-based applications".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cancancan>.freeze, ["~> 1.8"])
      s.add_runtime_dependency(%q<blacklight>.freeze, ["~> 6.0"])
      s.add_runtime_dependency(%q<deprecation>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 11.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<engine_cart>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<solr_wrapper>.freeze, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<cancancan>.freeze, ["~> 1.8"])
      s.add_dependency(%q<blacklight>.freeze, ["~> 6.0"])
      s.add_dependency(%q<deprecation>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 11.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<engine_cart>.freeze, ["~> 1.0"])
      s.add_dependency(%q<solr_wrapper>.freeze, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>.freeze, ["~> 4.0"])
      s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<cancancan>.freeze, ["~> 1.8"])
    s.add_dependency(%q<blacklight>.freeze, ["~> 6.0"])
    s.add_dependency(%q<deprecation>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 11.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<engine_cart>.freeze, ["~> 1.0"])
    s.add_dependency(%q<solr_wrapper>.freeze, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>.freeze, ["~> 4.0"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
  end
end
