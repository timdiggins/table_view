module TableView
  module Formats
    module Array
      def as_array
        array = []
        array << headers
        each_row do |row|
          array << row
        end
        array
      end
    end
  end
end
