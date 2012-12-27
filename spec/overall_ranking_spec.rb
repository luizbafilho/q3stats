require 'json'
require File.join(File.dirname(__FILE__), '..', 'game')
require File.join(File.dirname(__FILE__), '..', 'overall_ranking')

describe OverallRanking do

  describe "#to_json" do
    it 'returns the proper json' do

      player = Player.new([1, 'Player 1'])
      player2 = Player.new([2, 'Player 2'])

      player.kills = 2
      player.deaths = 1

      player2.kills = 3
      player2.deaths = 4

      game = Game.new

      game.add_player player
      game.add_player player2

      game2 = Game.new

      game2.add_player player
      game2.add_player player2

      ranking = OverallRanking.new([game, game2])
      ranking.create

      ranking.to_json.should eq(
        [
          {
            :name => 'Player 2',
            :kills => 6,
            :deaths => 8
          },
          {
            :name => 'Player 1',
            :kills => 4,
            :deaths => 2
          }
        ].to_json)
    end
  end

end