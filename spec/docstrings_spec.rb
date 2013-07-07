require 'spec_helper'

describe DocStrings do
  class TestClass
    def no_docstring
    end

    def simple
      """Simple"""
    end

    def multi_line
      """
        Line 1
        Line 2
      """
    end
  end

  def docstring_for_method(method_name)
    TestClass.instance_method(method_name).docstring
  end

  it "works with simple docstrings" do
    docstring_for_method(:simple).should == "Simple"
  end

  it "returns nil when no docstring" do
    docstring_for_method(:no_docstring).should be_nil
  end

  it "works with multiline docstrings" do
    docstring_for_method(:multi_line).should == "Line 1\nLine 2"
  end
end
