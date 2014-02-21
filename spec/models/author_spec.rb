require "spec_helper"

describe Author do
  context "creation" do
    context "string" do
      it "gets initialized with a string" do
        author = Author.new("Lic. Gimena Galarraga")
        author.name.should == "Gimena Galarraga"
        author.title.should == "Lic"
      end

      it "allows dots in the name" do
        author = Author.new("Lic. Gimena Galarraga. MP: 12345")
        author.name.should == "Gimena Galarraga. MP: 12345"
        author.title.should == "Lic"
      end

      it "removes pipes" do
        author = Author.new("L|ic. Gim||ena Galar|raga")
        author.name.should == "Gimena Galarraga"
        author.title.should == "Lic"
      end

      it "allows just the name" do
        author = Author.new("Gimena Galarraga")
        author.name.should == "Gimena Galarraga"
        author.title.should == ""
      end
    end
  end
  context "hash" do
    it "gets initialized with a hash" do
      author = Author.new(title: "Lic", name: "Gimena Galarraga")
      author.name.should == "Gimena Galarraga"
      author.title.should == "Lic"
    end

    it "allows dots in the name" do
      author = Author.new("title" => "Lic", "name" => "Gimena Galarraga. MP: 12345")
      author.name.should == "Gimena Galarraga. MP: 12345"
      author.title.should == "Lic"
    end

    it "removes pipes" do
      author = Author.new(title: "L|ic", name: "Gim||ena Galar|raga")
      author.name.should == "Gimena Galarraga"
      author.title.should == "Lic"
    end

    it "allows just the name" do
      author = Author.new("name" => "Gimena Galarraga")
      author.name.should == "Gimena Galarraga"
      author.title.should == ""
    end

    it "allows just the name" do
      author = Author.new("title" => "Gimena Galarraga")
      author.name.should == "Gimena Galarraga"
      author.title.should == ""
    end
  end

  context "string format" do
    it "formats itself" do
      author = Author.new("Lic. Gimena Galarraga")
      author.to_s.should == "Lic. Gimena Galarraga"
    end

    it "is an empty string if the fields are not set" do
      author = Author.new
      author.to_s.should == ""
    end

    it "is an empty string if the fields are empty" do
      author = Author.new(name: "", title: "")
      author.to_s.should == ""
    end
  end
end
