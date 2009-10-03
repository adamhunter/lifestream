require 'test/unit'
require 'rubygems'

gem 'thoughtbot-shoulda', '>= 2.10.1'
gem 'jnunemaker-matchy', '0.4.0'
gem 'mocha', '0.9.7'
gem 'redgreen', '>= 1.0.0'

require 'shoulda'
require 'matchy'
require 'mocha'
require 'fakeweb'
require 'redgreen' unless ENV['TM_FILENAME']

directory = File.expand_path(File.dirname(__FILE__))

require File.join(directory, '..', 'lib', 'lifestream')

Lifestream.options[:config] = 'lifestream.yml'

class Test::Unit::TestCase
  
  custom_matcher :be_nil do |receiver, matcher, args|
    matcher.positive_failure_message = "Expected #{receiver} to be nil but it wasn't"
    matcher.negative_failure_message = "Expected #{receiver} not to be nil but it was"
    receiver.nil?
  end
  
  custom_matcher :be_a do |receiver, matcher, args|
    receiver.class == args[0]
  end
  
  custom_matcher :be_empty do |receiver, matcher, args|
    matcher.positive_failure_message = "Expected #{receiver} to be empty but it wasn't"
    matcher.negative_failure_message = "Expected #{receiver} not to be empty but it was"
    receiver.empty?
  end
  
end