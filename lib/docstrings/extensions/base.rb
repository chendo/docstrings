module DocStrings
  module Extensions
    module Base
      module MethodExtension
        def docstring
          if respond_to?(:source)
            if source =~ Regexp.new(%Q{"""([\\s\\S]+?)"""})
              $1.gsub(/\n\s+/, "\n").strip
            end
          end
        end
      end
    end
  end
end
