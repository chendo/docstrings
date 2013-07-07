$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "docstrings/version"
require "docstrings/extensions/base"

module DocStrings
  module_function

  def init
    Method.send(:include, DocStrings::Extensions::Base::MethodExtension)
    UnboundMethod.send(:include, DocStrings::Extensions::Base::MethodExtension)
  end
end

DocStrings.init
