require 'rubis'

describe Rubis do
  describe "#search" do
    context "invalid inputs" do
      context "no parameters" do
        it "fails" do
          expect{ Rubis.search() }.to raise_exception
        end
      end

      context "too many parameters" do
        it "fails" do
          expect{ Rubis.search("test", english_name: "test") }.to raise_exception
        end
      end
    end

    context "valid inputs" do
      it "handles multifield search" do
        expect(Rubis.search("english").first.iso_639_1).to eq("en")
      end

      it "isn't overeager" do
        expect(Rubis.search(iso_639_1: "english").length).to eq(0)
      end

      it "handles specific search" do
        expect(Rubis.search(iso_639_1: "en").first.iso_639_1).to eq("en")
      end

      it "handles native-language search" do
        expect(Rubis.search("français").first.iso_639_1).to eq("fr")
      end

      it "handles transliterated native-language search" do
        expect(Rubis.search("francais").first.iso_639_1).to eq("fr")
      end

      it "confuses people who thought native_name was already transliterated" do
        expect(Rubis.search(native_name: "francais").length).to eq(0)
      end
    end
  end
end