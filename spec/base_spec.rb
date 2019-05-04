# frozen_string_literal: true

RSpec.describe TableView::Base do
  describe "given a valid defintion" do
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
    subject { MyTableView.new }
    describe "#as_array" do
      subject { super().as_array }
      it "can output headers" do
        expect(subject.first).to eq(%w[one two three])
      end
      it "can output row 1" do
        expect(subject[1]).to eq(%w[one1 two1 three1])
      end
      it "can output row 2" do
        expect(subject[2]).to eq(%w[one2 two2 three2])
      end
    end
    describe "#write_csv(io)" do
      subject do
        io = StringIO.new
        super().write_csv(io)
        io.string
      end
      it "can output csv headers" do
        expect(subject.split("\n").first).to eq("one,two,three")
      end
    end
  end
end
