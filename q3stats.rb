require './log_parser.rb'
require './game.rb'
require './player.rb'
require 'jbuilder'

class Q3Stats
  attr_reader :events
  def initialize
    @games = []
    parser = LogParser.new
    @events = parser.parse
  end

  def generate
    @events.each do |event|
      if event.type == :game
        add_game
      elsif event.type == :player
        current_game.add_player(Player.new(event.captures))
      elsif event.type == :kill
        current_game.add_kill(event.captures)
      end
    end
  end

  def to_json
    Jbuilder.encode do |json|
      json.array!(@games) do |game|
        json.total_kills game.total_kills
        json.players game.players.map {|p| p.name}
        json.kills game.players, :name, :kills
      end
    end
  end

  private

  def add_game
    @games << Game.new
  end

  def current_game
    @games.last
  end

end