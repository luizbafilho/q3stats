require File.join(File.dirname(__FILE__), '..', 'event')

describe Event do
  describe "#initialize" do
    before(:all) do
      @event = Event.new(:player, [1, 'Player 1'])
    end

    it "returns the passed type" do
      @event.type.should eq(:player)
    end

    it "returns the passed captures" do
      @event.captures.should eq([1, 'Player 1'])
    end
  end
end