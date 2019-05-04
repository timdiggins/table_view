RSpec.describe TableView::Formats::CSV do
  describe "given a valid defintion" do
    subject { MyTableView.new }
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

    describe "#write_csv(filepath)" do
      let(:fixture) { File.join(FIXTURES_PATH, "csv", "my_table_view.csv") }
      let(:output) { File.join(FIXTURES_PATH, "csv", "my_table_view.got.csv") }
      before do
        FileUtils.safe_unlink(output)
      end
      it "can output csv" do
        expect { subject.write_csv(output) }.to change { File.exists?(output) }.to be_truthy
        expect(File.read(output)).to eq(File.read(fixture))
      end

    end

    describe "#as_csv" do
      it "can output csv headers" do
        expect(subject.as_csv.split("\n").first).to eq("one,two,three")
      end
    end
  end
end
