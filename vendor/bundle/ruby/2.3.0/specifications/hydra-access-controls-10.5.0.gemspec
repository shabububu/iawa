# -*- encoding: utf-8 -*-
# stub: hydra-access-controls 10.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hydra-access-controls".freeze
  s.version = "10.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Beer".freeze, "Justin Coyne".freeze, "Matt Zumwalt".freeze]
  s.date = "2017-06-09"
  s.description = "Access controls for project hydra".freeze
  s.email = ["hydra-tech@googlegroups.com".freeze]
  s.homepage = "http://projecthydra.org".freeze
  s.licenses = ["APACHE-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Access controls for project hydra".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, ["< 6", ">= 4"])
      s.add_runtime_dependency(%q<active-fedora>.freeze, ["< 12", ">= 10.0.0"])
      s.add_runtime_dependency(%q<cancancan>.freeze, ["~> 1.8"])
      s.add_runtime_dependency(%q<deprecation>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<blacklight>.freeze, [">= 5.16"])
      s.add_runtime_dependency(%q<blacklight-access_controls>.freeze, ["~> 0.6"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
    else
      s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4"])
      s.add_dependency(%q<active-fedora>.freeze, ["< 12", ">= 10.0.0"])
      s.add_dependency(%q<cancancan>.freeze, ["~> 1.8"])
      s.add_dependency(%q<deprecation>.freeze, ["~> 1.0"])
      s.add_dependency(%q<blacklight>.freeze, [">= 5.16"])
      s.add_dependency(%q<blacklight-access_controls>.freeze, ["~> 0.6"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4"])
    s.add_dependency(%q<active-fedora>.freeze, ["< 12", ">= 10.0.0"])
    s.add_dependency(%q<cancancan>.freeze, ["~> 1.8"])
    s.add_dependency(%q<deprecation>.freeze, ["~> 1.0"])
    s.add_dependency(%q<blacklight>.freeze, [">= 5.16"])
    s.add_dependency(%q<blacklight-access_controls>.freeze, ["~> 0.6"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
  end
end
