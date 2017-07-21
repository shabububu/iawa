# -*- encoding: utf-8 -*-
# stub: http_logger 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "http_logger".freeze
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bogdan Gusiev".freeze]
  s.date = "2014-11-07"
  s.description = "This gem keep an eye on every Net::HTTP library usage and dump all request and response data to the log file".freeze
  s.email = "agresso@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze]
  s.files = ["LICENSE.txt".freeze]
  s.homepage = "http://github.com/railsware/http_logger".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Log your http api calls just like SQL queries".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<debugger>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<jeweler>.freeze, [">= 0"])
      s.add_development_dependency(%q<fakeweb>.freeze, [">= 0"])
    else
      s.add_dependency(%q<debugger>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<jeweler>.freeze, [">= 0"])
      s.add_dependency(%q<fakeweb>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<debugger>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<jeweler>.freeze, [">= 0"])
    s.add_dependency(%q<fakeweb>.freeze, [">= 0"])
  end
end
