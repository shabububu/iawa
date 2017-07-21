# -*- encoding: utf-8 -*-
# stub: ruby-box 1.15.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-box".freeze
  s.version = "1.15.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Attachments.me".freeze]
  s.date = "2014-10-16"
  s.description = "ruby gem for box.com 2.0 api".freeze
  s.email = "ben@attachments.me".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.markdown".freeze]
  s.files = ["LICENSE.txt".freeze, "README.markdown".freeze]
  s.homepage = "http://github.com/attachmentsme/ruby-box".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "ruby gem for box.com 2.0 api".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<multipart-post>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<oauth2>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<addressable>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<jeweler>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
    else
      s.add_dependency(%q<multipart-post>.freeze, [">= 0"])
      s.add_dependency(%q<oauth2>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<addressable>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<jeweler>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<multipart-post>.freeze, [">= 0"])
    s.add_dependency(%q<oauth2>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<addressable>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<jeweler>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
  end
end
