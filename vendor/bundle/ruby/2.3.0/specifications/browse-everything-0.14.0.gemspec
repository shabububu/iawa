# -*- encoding: utf-8 -*-
# stub: browse-everything 0.14.0 ruby lib

Gem::Specification.new do |s|
  s.name = "browse-everything".freeze
  s.version = "0.14.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Carolyn Cole".freeze, "Jessie Keck".freeze, "Michael B. Klein".freeze, "Thomas Scherz".freeze, "Xiaoming Wang".freeze, "Jeremy Friesen".freeze]
  s.date = "2017-07-07"
  s.description = "AJAX/Rails engine file browser for cloud storage services".freeze
  s.email = ["cam156@psu.edu".freeze, "jkeck@stanford.edu".freeze, "mbklein@gmail.com".freeze, "scherztc@ucmail.uc.edu".freeze, "xw5d@virginia.edu".freeze, "jeremy.n.friesen@gmail.com".freeze]
  s.homepage = "https://github.com/projecthydra/browse-everything".freeze
  s.licenses = ["Apache 2".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "AJAX/Rails engine file browser for cloud storage services".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 3.1"])
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.5"])
      s.add_runtime_dependency(%q<google_drive>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<dropbox-sdk>.freeze, [">= 1.6.2"])
      s.add_runtime_dependency(%q<skydrive>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<ruby-box>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<sass-rails>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<bootstrap-sass>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<font-awesome-rails>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<google-api-client>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<signet>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<httparty>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<aws-sdk>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.42.0"])
      s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 1.8.0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<engine_cart>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<capybara>.freeze, [">= 0"])
      s.add_development_dependency(%q<jasmine>.freeze, ["~> 2.3"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_development_dependency(%q<poltergeist>.freeze, ["~> 1.10"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 3.1"])
      s.add_dependency(%q<addressable>.freeze, ["~> 2.5"])
      s.add_dependency(%q<google_drive>.freeze, [">= 0"])
      s.add_dependency(%q<dropbox-sdk>.freeze, [">= 1.6.2"])
      s.add_dependency(%q<skydrive>.freeze, [">= 0"])
      s.add_dependency(%q<ruby-box>.freeze, [">= 0"])
      s.add_dependency(%q<sass-rails>.freeze, [">= 0"])
      s.add_dependency(%q<bootstrap-sass>.freeze, [">= 0"])
      s.add_dependency(%q<font-awesome-rails>.freeze, [">= 0"])
      s.add_dependency(%q<google-api-client>.freeze, ["~> 0.9"])
      s.add_dependency(%q<signet>.freeze, [">= 0"])
      s.add_dependency(%q<httparty>.freeze, [">= 0"])
      s.add_dependency(%q<aws-sdk>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.42.0"])
      s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.8.0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>.freeze, [">= 0"])
      s.add_dependency(%q<engine_cart>.freeze, ["~> 1.0"])
      s.add_dependency(%q<capybara>.freeze, [">= 0"])
      s.add_dependency(%q<jasmine>.freeze, ["~> 2.3"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<poltergeist>.freeze, ["~> 1.10"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.1"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.5"])
    s.add_dependency(%q<google_drive>.freeze, [">= 0"])
    s.add_dependency(%q<dropbox-sdk>.freeze, [">= 1.6.2"])
    s.add_dependency(%q<skydrive>.freeze, [">= 0"])
    s.add_dependency(%q<ruby-box>.freeze, [">= 0"])
    s.add_dependency(%q<sass-rails>.freeze, [">= 0"])
    s.add_dependency(%q<bootstrap-sass>.freeze, [">= 0"])
    s.add_dependency(%q<font-awesome-rails>.freeze, [">= 0"])
    s.add_dependency(%q<google-api-client>.freeze, ["~> 0.9"])
    s.add_dependency(%q<signet>.freeze, [">= 0"])
    s.add_dependency(%q<httparty>.freeze, [">= 0"])
    s.add_dependency(%q<aws-sdk>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.42.0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.8.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>.freeze, [">= 0"])
    s.add_dependency(%q<engine_cart>.freeze, ["~> 1.0"])
    s.add_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_dependency(%q<jasmine>.freeze, ["~> 2.3"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<poltergeist>.freeze, ["~> 1.10"])
  end
end
