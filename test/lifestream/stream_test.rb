require 'test_helper'

class StreamTest < Test::Unit::TestCase
  
  context "A Lifestream::Stream instance" do
    
    setup { @lifestream = Lifestream.run }
    
    should "return its branches in descending chronological order" do
      @lifestream.branches.should_not be_nil
      @lifestream.branches.each do |branch|
        compare ||= branch
        compare.published_at.should >= branch.published_at
        compare = branch
      end
    end
    
  end
  
end