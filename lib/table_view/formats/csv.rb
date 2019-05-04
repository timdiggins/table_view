require "csv"

module TableView
  module Formats
    module CSV
      def as_csv
        StringIO.open do |io|
          write_csv_to_io(io)
          io.string
        end
      end

      def write_csv(filepath_or_io)
        if filepath_or_io.is_a?(String)
          File.open(filepath_or_io, "wb") do |f|
            write_csv_to_io(f)
          end
        else
          write_csv_to_io(filepath_or_io)
        end
      end

      protected

      def write_csv_to_io(io)
        csv = ::CSV.new(io)
        csv << headers
        each_row do |row|
          csv << row
        end
        csv.close
      end
    end
  end
end
