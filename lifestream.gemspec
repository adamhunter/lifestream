# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lifestream}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Hunter"]
  s.date = %q{2009-10-03}
  s.email = %q{adamhunter@me.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "README",
     "Rakefile",
     "VERSION",
     "lib/lifestream.rb",
     "lib/lifestream/branch.rb",
     "lib/lifestream/channel.rb",
     "lib/lifestream/channel/rss2.rb",
     "lib/lifestream/request.rb",
     "lib/lifestream/source.rb",
     "lib/lifestream/stream.rb",
     "test/lifestream.yml",
     "test/lifestream/branch_test.rb",
     "test/lifestream/channel_test.rb",
     "test/lifestream/source_test.rb",
     "test/lifestream/stream_test.rb",
     "test/lifestream_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/adamhunter/lifestream}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{downloads and parses lifestream information from sources like facebook and twitter}
  s.test_files = [
    "test/lifestream/branch_test.rb",
     "test/lifestream/channel_test.rb",
     "test/lifestream/source_test.rb",
     "test/lifestream/stream_test.rb",
     "test/lifestream_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 2.10.1"])
      s.add_development_dependency(%q<jnunemaker-matchy>, ["= 0.4.0"])
      s.add_development_dependency(%q<mocha>, ["= 0.9.4"])
      s.add_development_dependency(%q<redgreen>, ["= 1.0.0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 2.10.1"])
      s.add_dependency(%q<jnunemaker-matchy>, ["= 0.4.0"])
      s.add_dependency(%q<mocha>, ["= 0.9.4"])
      s.add_dependency(%q<redgreen>, ["= 1.0.0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 2.10.1"])
    s.add_dependency(%q<jnunemaker-matchy>, ["= 0.4.0"])
    s.add_dependency(%q<mocha>, ["= 0.9.4"])
    s.add_dependency(%q<redgreen>, ["= 1.0.0"])
  end
end