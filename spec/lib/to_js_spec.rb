require 'spec_helper'

class A
  def initialize a
    @a = a
  end

  def to_s
    @a
  end
end

describe "Object#to_js" do
  it "should return quoted string for string" do
    "Hello".to_js.should == "\"Hello\""
  end

  it "should return string representation for fixnum" do
    5.to_js.should == "5"
  end

  it "should return string representation for float" do
    5.5.to_js.should == "5.5"
  end

  it "should return string representation for bigint" do
    (1000**1000).to_js.should == (1000**1000).to_s
  end

  it "should return undefined for nil" do
    nil.to_js.should == "undefined"
  end

  it "should return js array literal for array" do
    [1, 2, "Hello"].to_js.should == "[1, 2, \"Hello\"]"
  end

  it "should return js array literal for set", :ruby => 1.9 do
    Set.new([1, 2, "Hello"]).to_js.should == "[1, 2, \"Hello\"]"
  end

  it "should return js object literal for hash", :ruby => 1.9 do
    {:a => "hello", :b => 5, "c" => "world"}.to_js.should == "{a: \"hello\", b: 5, c: \"world\"}"
  end

  it "should return js object literal for hash", :ruby => 1.8 do
    require 'active_support/ordered_hash'
    ActiveSupport::OrderedHash[
      :a, "hello", :b, 5, "c", "world"
    ].to_js.should == "{a: \"hello\", b: 5, c: \"world\"}"
  end

  it "should return to_s representation of object" do
    A.new("Hello").to_js.should == "Hello"
  end

  it "should return direct to_s representation of symbol" do
    :hello.to_js.should == "hello"
  end

  it "should return string without graves to string with graves" do
    "`Hello`".to_js.should == "Hello"
  end

  it "should return date wrapped as string" do
    Date.new(2012, 12, 21).to_js.should == "\"2012-12-21\""
  end

  it "should return time wrapped as string" do
    moment = Time.at(0)
    moment.to_js.should == "\"#{moment.to_s}\""
  end

end
