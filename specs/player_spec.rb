require File.join(File.dirname(__FILE__), '..', 'player')

describe Player do
  describe "#initialize" do

    before(:all) do
      @player = Player.new([0, "Test"])
    end

    it "returns the passed id" do
      @player.id.should eq(0)
    end

    it "returns the passed name" do
      @player.name.should eq("Test")
    end

    it "returns the kills equals 0" do
      @player.kills.should eq(0)
    end
  end
end