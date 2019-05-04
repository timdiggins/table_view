class MyTableView < TableView::Base
  def headers
    %w[one two three]
  end

  def each_row
    1.upto(2).each do |n|
      yield [
        "one#{n}",
        "two#{n}",
        "three#{n}"
      ]
    end
  end
end
