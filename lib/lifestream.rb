require 'rubygems'
require 'erb'

module Lifestream
  
  # Provides configurability to Lifestream. There are a number of options available, such as:
  # * whiny: Will raise an error if Lifestream cannot process a given feed.  
  #   Defaults to true 
  # * config: Path to the lifestream.yml file that contains the feeds to download.
  #   Defaults to gem location, you will probably want to set this
  def self.options
    @options ||= {
      :config => File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lifestream.yml'),
      :whiny  => true
    }
  end
  
  # Generates a Lifestream::Stream which contains all the channels
  # with their branches parsed from the feeds in the lifestream.yml file, 
  # ordered by their published_at date.
  def self.run(preload = false)
    lifestream = Lifestream::Stream.new
    ensure_configuration_exists
    
    feeds = YAML.load(File.open(options[:config]))
    feeds.each_pair do |name, options|
      klass = Lifestream::Channel.const_get(options['format'])
      channel = klass.new(name, options['url'])
      channel.branches if preload
      lifestream.channels << channel
    end
    lifestream
  end
  
  protected
  
  def self.ensure_configuration_exists
    raise Lifestream::NoConfiguration.new("You must provide a configuration file") unless File.exists?(options[:config])
  end
  
  class NoConfiguration < StandardError; end
  
end

directory = File.expand_path(File.dirname(__FILE__))

# yes most of these are all named after parts of a stream
# http://en.wikipedia.org/wiki/Stream#Parts_of_a_stream
require File.join(directory, 'lifestream', 'branch')
require File.join(directory, 'lifestream', 'channel')
require File.join(directory, 'lifestream', 'channel', 'rss2')
require File.join(directory, 'lifestream', 'request')
require File.join(directory, 'lifestream', 'source')
require File.join(directory, 'lifestream', 'stream')

