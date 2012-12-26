require './game.rb'
require './player.rb'

class Q3StatsParser

  def initialize
    @log_lines = File.readlines('logs/games.log')
    @games = []
  end

end