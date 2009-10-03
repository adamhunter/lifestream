require 'test_helper'

class StreamTest < Test::Unit::TestCase
  
  context "A Lifestream::Stream instance" do
    
    setup { @lifestream = Lifestream.run }
    
    should "return its branches in descending chronological order" do
      @lifestream.branches.should_not be_nil
      @lifestream.branches[0].published_at.should > @lifestream.branches[1].published_at
    end
    
  end
  
end