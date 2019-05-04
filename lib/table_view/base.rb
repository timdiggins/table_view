# frozen_string_literal: true

require "csv"

module TableView
  class Base
    def as_array
      array = []
      array << headers
      each_row do |row|
        array << row
      end
      array
    end

    def write_csv(io)
      csv = CSV.new(io)
      csv << headers
      each_row do |row|
        csv << row
      end
      csv.close
    end
  end
end
