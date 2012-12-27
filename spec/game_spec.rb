require File.join(File.dirname(__FILE__), '..', 'game')

describe Game do
  describe "#initialize" do
    let(:game) { Game.new }

    it "returns total kills equals 0" do
      game.total_kills.should eq(0)
    end

    it "length of players should be 0" do
      game.players.size.should eq(0)
    end
  end

  describe "#add_player" do
    let(:game) { Game.new }

    it "adds the new player to the game" do
      player = Player.new([1, 'Player 1'])
      game.add_player player
      game.players.first.should eq(player)
    end

    it "renames the existent player in the game" do
      player = Player.new([1, 'Player 1'])
      renamed_player = Player.new([1, 'Player 1 - Renamed'])

      game.add_player player
      game.add_player renamed_player

      game.players.first.name.should eq(renamed_player.name)
    end
  end

  describe "#add_kill" do
    before(:each) do
      @game = Game.new
      @player = Player.new([1, 'Player 1'])
      @player2 = Player.new([2, 'Player 2'])
      @game.add_player @player
      @game.add_player @player2
    end

    it "increments the total_kills variable" do
      @game.add_kill(['Player 1', 'Player 2', 'MOD_HURT'])
      @game.total_kills.should eq(1)
    end

    it "adds the kill for the player" do
      @player.should_receive(:add_kill)
      @game.add_kill(['Player 1', 'Player 2', 'MOD_HURT'])
    end

    it "removes the kill for the player" do
      @player.should_receive(:remove_kill)
      @game.add_kill(['<world>', 'Player 1', 'MOD_HURT'])
    end

    it "adds a death to the killed player" do
      @player2.should_receive(:add_death)
      @game.add_kill(['Player 1', 'Player 2', 'MOD_HURT'])
    end
  end
end