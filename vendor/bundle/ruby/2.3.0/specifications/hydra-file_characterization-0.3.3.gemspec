# -*- encoding: utf-8 -*-
# stub: hydra-file_characterization 0.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "hydra-file_characterization".freeze
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["James Treacy".freeze, "Jeremy Friesen".freeze, "Sue Richeson".freeze, "Rajesh Balekai".freeze]
  s.date = "2015-10-15"
  s.description = "To provide a wrapper for file characterization".freeze
  s.email = ["jatr@kb.dk".freeze, "jeremy.n.friesen@gmail.com".freeze, "spr7b@virginia.edu".freeze, "rbalekai@gmail.com".freeze]
  s.homepage = "https://github.com/projecthydra/hydra-file_characterization".freeze
  s.licenses = ["APACHE2".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "To provide a wrapper for file characterization".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<guard>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<guard>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
  end
end
