# -*- encoding: utf-8 -*-
# stub: skydrive 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "skydrive".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rony Varghese".freeze]
  s.date = "2015-03-06"
  s.description = "Simple ruby client library for Skydrive cloud storage service with OAuth2".freeze
  s.email = ["rony@mobme.in".freeze]
  s.homepage = "https://github.com/ronyv89/skydrive".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Ruby client library for Microsoft Skydrive".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>.freeze, [">= 0.11.0"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<httmultiparty>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<oauth2>.freeze, [">= 0.9.2"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rb-inotify>.freeze, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<guard>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<metric_abc>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<ci_reporter>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov-rcov>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdiscount>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec_multi_matchers>.freeze, [">= 0"])
    else
      s.add_dependency(%q<httparty>.freeze, [">= 0.11.0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 0"])
      s.add_dependency(%q<httmultiparty>.freeze, [">= 0"])
      s.add_dependency(%q<oauth2>.freeze, [">= 0.9.2"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rb-inotify>.freeze, [">= 0"])
      s.add_dependency(%q<rb-fsevent>.freeze, ["~> 0.9"])
      s.add_dependency(%q<guard>.freeze, [">= 0"])
      s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<metric_abc>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<ci_reporter>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov-rcov>.freeze, [">= 0"])
      s.add_dependency(%q<rdiscount>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<rspec_multi_matchers>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>.freeze, [">= 0.11.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<httmultiparty>.freeze, [">= 0"])
    s.add_dependency(%q<oauth2>.freeze, [">= 0.9.2"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rb-inotify>.freeze, [">= 0"])
    s.add_dependency(%q<rb-fsevent>.freeze, ["~> 0.9"])
    s.add_dependency(%q<guard>.freeze, [">= 0"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<metric_abc>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<ci_reporter>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov-rcov>.freeze, [">= 0"])
    s.add_dependency(%q<rdiscount>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<rspec_multi_matchers>.freeze, [">= 0"])
  end
end
