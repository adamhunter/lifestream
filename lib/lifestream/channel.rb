module Lifestream
  class Channel
    
    attr_accessor :name, :branches, :raw_text, :feed
    
    def initialize name, url
      @name, @branches, @request = name, [], Lifestream::Request.new(url)
    end
    
    def branches
      create_branches if @branches.empty?
      @branches
    end
    
    protected
    
    def download
      response = @request.get
      raise unless response.kind_of?(Net::HTTPSuccess)
      @raw_data = response.body
    rescue => e
      Lifestream::Channel::DownloadError.new("The URL #{@request.url} failed to download") if Lifestream.options[:whiny]
    end
    
    def create_branches
      download
      parse
      feed_to_a.each do |item|
        @branches << to_branch(item)
      end
    end
    
    def parse
      raise_method_error :parse
    end
    
    def feed_to_a
      raise_method_error :feed_to_a
    end
    
    def to_branch
      raise_method_error :to_branch
    end
    
    private
    
    def raise_method_error method
      raise Lifestream::Channel::MethodError, "Method `#{method}` must be overriden in the child class"
    end
    
    class MethodError < StandardError; end
    class DownloadError < StandardError; end
    
  end
end