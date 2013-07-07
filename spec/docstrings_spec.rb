require 'spec_helper'

describe Docstrings do
  class TestClass
    def no_docstring
    end

    def simple_docstring
      """Simple"""
    end
  end

  def docstring_for_method(method_name)
    TestClass.instance_method(method_name).docstring
  end

  it "works with simple docstrings" do
    docstring_for_method(:simple_docstring).should == "Simple"
  end

  it "returns nil when no docstring" do
    docstring_for_method(:no_docstring).should be_nil
  end
end
