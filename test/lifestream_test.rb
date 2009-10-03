require 'test_helper'

class LifestreamTest < Test::Unit::TestCase
  
  context "The Lifestream module" do
    
    should "create a Lifestream::Stream instance with all of its channels and branches" do
      @lifestream = Lifestream::run
      @lifestream.channels.size.should == 3
      @lifestream.channels.each { |c| c.should_not be_nil }
      @lifestream.channels.each { |c| c.should be_a(Lifestream::Channel::Rss2) }
      @lifestream.channels.each do |c| 
        c.branches.each { |b| b.should_not be_nil }
        c.branches.each { |b| b.should be_a(Lifestream::Branch) }
      end
    end
    
    should "set the configuration file to the provided path" do
      original_path = Lifestream.options[:config]
      test_config_path = 'some/config'
      Lifestream.options[:config] = test_config_path
      Lifestream.options[:config].should == test_config_path
      Lifestream.options[:config] = original_path
    end
    
  end
  
end