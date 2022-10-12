require_relative "../isbn_creator"
require 'rspec'

RSpec.describe IsbnCreator do
  before do
    @isbn = 978014300723
    @creator = IsbnCreator.new(@isbn)
  end

  context "ISBN Creation" do
    it "should generate ISBN" do
      isbn_no = @creator.get_calculated_isbn

      expect(isbn_no).to eq("9780143007234")
    end

    it "should increase length by 1" do
      isbn_no = @creator.get_calculated_isbn
    
      expect(isbn_no.length).to eq(@isbn.to_s.length + 1)
    end

    it "all digits of isbn no. should be same as isbn input except last digit" do
      isbn_no = @creator.get_calculated_isbn

      expect(isbn_no.chop).to eq(@isbn.to_s)
    end
  end

  context "validation" do
    context "should pass" do
      it "input isbn_no's length should be 12" do
        isbn_no = @creator.get_calculated_isbn

        expect(isbn_no).to_not be_nil
      end

      it "isbn should be digits only" do
        isbn_no = @creator.get_calculated_isbn

        expect(isbn_no).to_not be_nil
      end
    end

    context " should fail" do
      it "should be fail if length of isbn not equal to 12" do
        isbn = 9780143007231

        expect{IsbnCreator.new(isbn)}.to raise_error(StandardError)
      end

      it "should be fail if input isbn is non-integer" do
        isbn = "97801430072ab"

        expect{IsbnCreator.new(isbn)}.to raise_error(StandardError)
      end
    end
  end
end
