require 'rubygems'
require 'rake'

require(File.join(File.dirname(__FILE__), 'lib', 'lifestream'))

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name              = "lifestream"
    gem.summary           = %Q{downloads and parses lifestream information from sources like facebook and twitter}
    gem.email             = "adamhunter@me.com"
    gem.homepage          = "http://github.com/adamhunter/lifestream"
    gem.authors           = ["Adam Hunter"]
    #gem.rubyforge_project = "lifestream"
    gem.files             = FileList["[A-Z]*", "{lib,test}/**/*"]
    
    #gem.add_dependency('httparty', '0.4.3')
    
    gem.add_development_dependency('thoughtbot-shoulda', '>= 2.10.1')
    gem.add_development_dependency('jnunemaker-matchy', '0.4.0')
    gem.add_development_dependency('mocha', '0.9.4')
    gem.add_development_dependency('redgreen', '1.0.0')
  end
  
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "lifestream #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :lifestream do
  
  desc "Generate lifestream.yml file"
  task :configure do
    
  end

end
