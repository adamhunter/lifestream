module Lifestream
  class Branch
    
    attr_accessor :published_at, :title, :body
    
    def initialize published_at, title, body = nil
      @published_at, @title, @body = published_at, title, body
    end
    
  end
end