require './string.rb'
require './game.rb'
require './player.rb'
require 'jbuilder'

class Q3StatsParser

  def initialize
    @log_lines = File.readlines('logs/games.log')
    @games = []
  end

  def parse
    @log_lines.each do |line|
      if line.game?
        add_game
      elsif line.player?
        current_game.add_player(Player.new(line.raw_player))
      elsif line.kill?
        current_game.add_kill(line.raw_kill)
      end
    end
  end

  def add_game
    @games << Game.new
  end

  def to_builder
    json = Jbuilder.new
    json.array!(@games) do |game|
      json.total_kills game.total_kills
      json.players game.players.map {|p| p.name}
      json.kills game.players, :name, :kills
    end
    json
  end

  private

  def current_game
    @games.last
  end

end