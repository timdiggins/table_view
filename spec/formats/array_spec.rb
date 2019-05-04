# frozen_string_literal: true

# frozen_string_literal: true

RSpec.describe TableView::Formats::Array do
  describe "given a valid defintion" do
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
  end
end
