require_relative 'helper'

describe Bindi do
  before do
    @bindi = Bindi.new
  end
  
  describe "getting a list of keys with @bindi.keys" do
    it "returns an Array" do
      assert_kind_of Array, @bindi.keys
    end
  end
  
  describe "getting true or false if key exists with @bindi.key?" do
    before do
      @bindi[:cake] = 'yummy'
    end
    
    it "returns true if key exists" do
      assert @bindi.key?(:cake)
    end
    
    it "returns false if the key doesn't exist" do
      refute @bindi.key?(:this_does_not_exist)
    end
  end
  
  describe "getting a particular key's value with @bindi.[]" do
    before do
      @bindi[:cake] = 'yummy'
    end
    
    it "returns a value if the key exists" do
      assert_equal 'yummy', @bindi[:cake]
    end
    
    it "returns nil if the key doesn't exist" do
      assert_nil @bindi[:this_does_not_exist]
    end
  end
  
  describe "setting a particular key's value with @bindi.[]=" do
    before do
      @bindi[:trees] = ['oak', 'pine', 'cedar']
    end
    
    it "should add the key to the persistent store" do
      assert @bindi.key?(:trees)
    end
    
    it "should be set to the expected value" do
      assert_equal ["oak", "pine", "cedar"], @bindi[:trees]
    end
  end
  
  describe "deleting a root key with @bindi.delete" do
    before do
      @bindi[:cake] = 'yummy'
    end
    
    it "returns the value of the deleted key" do
      assert_equal "yummy", @bindi.delete(:cake)
    end
  end
end
