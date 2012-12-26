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

  describe "#add_kill" do

    before do
      @player = Player.new([0, "Test"])
    end

    it "adds one kill to the player" do
      @player.add_kill
      @player.kills.should eq(1)
    end
  end

  describe "#removekill" do

    before do
      @player = Player.new([0, "Test"])
    end

    it "removes one kill from the player" do
      @player.remove_kill
      @player.kills.should eq(-1)
    end
  end
end