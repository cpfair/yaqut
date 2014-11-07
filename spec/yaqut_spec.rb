require 'yaqut'

describe Yaqut do
  describe "#search" do
    context "invalid inputs" do
      context "no parameters" do
        it "fails" do
          expect{ Yaqut.search }.to raise_exception
        end
      end

      context "too many parameters" do
        it "fails" do
          expect{ Yaqut.search("test", english_name: "test") }.to raise_exception
        end
      end
    end

    context "valid inputs" do
      it "handles multifield search" do
        expect(Yaqut.search("english").first.iso_639_1).to eq("en")
      end

      it "isn't overeager" do
        expect(Yaqut.search(iso_639_1: "english").length).to eq(0)
      end

      it "handles specific search" do
        expect(Yaqut.search(iso_639_1: "en").first.iso_639_1).to eq("en")
      end

      it "handles native-language search" do
        expect(Yaqut.search("français").first.iso_639_1).to eq("fr")
      end

      it "handles transliterated native-language search" do
        expect(Yaqut.search("francais").first.iso_639_1).to eq("fr")
      end

      it "confuses people who thought native_name was already transliterated" do
        expect(Yaqut.search(native_name: "francais").length).to eq(0)
      end
    end
  end
end
