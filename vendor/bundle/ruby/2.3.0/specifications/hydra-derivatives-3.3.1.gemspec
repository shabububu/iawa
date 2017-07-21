# -*- encoding: utf-8 -*-
# stub: hydra-derivatives 3.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "hydra-derivatives".freeze
  s.version = "3.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Justin Coyne".freeze]
  s.date = "2017-06-22"
  s.description = "Derivative generation plugin for hydra".freeze
  s.email = ["justin@curationexperts.com".freeze]
  s.homepage = "https://github.com/projecthydra/hydra-derivatives".freeze
  s.licenses = ["APACHE2".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Derivative generation plugin for hydra".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<solr_wrapper>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.2"])
      s.add_runtime_dependency(%q<active-fedora>.freeze, ["< 12", ">= 11.3.1"])
      s.add_runtime_dependency(%q<mini_magick>.freeze, ["< 5", ">= 3.2"])
      s.add_runtime_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.0"])
      s.add_runtime_dependency(%q<mime-types>.freeze, ["< 4.0", "> 2.0"])
      s.add_runtime_dependency(%q<active_encode>.freeze, ["~> 0.1"])
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.5"])
      s.add_runtime_dependency(%q<deprecation>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<solr_wrapper>.freeze, ["~> 0.4"])
      s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.2"])
      s.add_dependency(%q<active-fedora>.freeze, ["< 12", ">= 11.3.1"])
      s.add_dependency(%q<mini_magick>.freeze, ["< 5", ">= 3.2"])
      s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.0"])
      s.add_dependency(%q<mime-types>.freeze, ["< 4.0", "> 2.0"])
      s.add_dependency(%q<active_encode>.freeze, ["~> 0.1"])
      s.add_dependency(%q<addressable>.freeze, ["~> 2.5"])
      s.add_dependency(%q<deprecation>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<solr_wrapper>.freeze, ["~> 0.4"])
    s.add_dependency(%q<fcrepo_wrapper>.freeze, ["~> 0.2"])
    s.add_dependency(%q<active-fedora>.freeze, ["< 12", ">= 11.3.1"])
    s.add_dependency(%q<mini_magick>.freeze, ["< 5", ">= 3.2"])
    s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.0"])
    s.add_dependency(%q<mime-types>.freeze, ["< 4.0", "> 2.0"])
    s.add_dependency(%q<active_encode>.freeze, ["~> 0.1"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.5"])
    s.add_dependency(%q<deprecation>.freeze, [">= 0"])
  end
end
