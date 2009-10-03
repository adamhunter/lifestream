require 'rss/1.0'
require 'rss/2.0'

module Lifestream
  class Channel::Rss2 < Lifestream::Channel
   
    protected
  
    def parse
      @feed = RSS::Parser.parse(@raw_data, false)
    rescue => e
      raise Lifestream::Channel::Rss2::MalformedFeed.new("The feed from #{@url} could not be parsed") if Lifestream.options[:whiny]
    end
  
    def feed_to_a
      @feed.items || []
    end
  
    def to_branch(branch)
      Lifestream::Branch.new(branch.pubDate, branch.title, branch.description)
    end
  
    class MalformedFeed < StandardError; end
    
  end
end