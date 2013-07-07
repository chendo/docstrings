module DocStrings
  module Extensions
    module Base
      module MethodExtension
        def docstring
          path, line_number = source_location

          if path && File.exists?(path)
            file = File.read(path)

            # FIXME: This will work terribly for large files
            if file =~ Regexp.new(%Q{\\A(?:.*?\n){#{line_number}}\s*?"""([\\s\\S]+?)"""})
              $1.gsub(/\n\s+/, "\n").strip
            end
          end
        end
      end
    end
  end
end
