module Lifestream
  class Branch
    
    attr_accessor :channel, :published_at, :title, :body
    
    def initialize channel, published_at, title, body = nil
      @channel, @published_at, @title, @body = channel, published_at, title, body
      unless @channel.kind_of?(Lifestream::Channel)
        raise Lifestream::Branch::InvalidBranch.new('@channel is not a kind if Lifestream::Channel') 
      end
    end
    
    def inspect
      "#<Lifestream::Branch @published_at=#{@published_at} @title=#{@title} @body=#{@body} @channel=#{!!@channel}>"
    end
    
    class InvalidBranch < StandardError; end
    
  end
end