# frozen_string_literal: true

require_relative "formats/array"
require_relative "formats/csv"

module TableView
  class Base
    include TableView::Formats::Array
    include TableView::Formats::CSV
  end
end
