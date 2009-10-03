module Lifestream
  class Stream
  
    attr_accessor :channels
  
    def initialize channels = []
      @channels = channels
    end
    
    def branches
      @branches ||= []
      return @branches unless @branches.empty?
      @channels.each do |channel|
        channel.branches.each { |b| @branches << b }
      end
      @branches.sort! { |a,b| a.published_at <=> b.published_at }.reverse!
    end
    
  end
end