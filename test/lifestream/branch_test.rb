require 'test_helper'

class BranchTest < Test::Unit::TestCase
  
  context "A Lifestream::Branch instance" do
    
    setup { @lifestream = Lifestream.run }
    
    should "be aware of its parent channel" do
      @lifestream.branches.first.channel.should_not be_nil
      @lifestream.branches.first.channel.should be_a(Lifestream::Channel::Rss2)
    end
    
    should "raise an exception if the channel is set to a non channel object" do
      assert_raise Lifestream::Branch::InvalidBranch do
        Lifestream::Branch.new nil, 'hi', 'hi', 'hi'
      end
    end
    
  end
  
end