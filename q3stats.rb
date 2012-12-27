require './log_parser.rb'
require './game.rb'
require './player.rb'
require 'jbuilder'

# Public: Main application class. Organize all the information in the way that makes possible
# return all the information as a json.
class Q3Stats

  # Public: Events array.
  attr_reader :events

  # Public: Initialize the games array. Calls the parser and set the returned events.
  def initialize
    @games = []
    parser = LogParser.new
    @events = parser.parse
  end

  # Public: Generate the stats.
  #
  # Returns nothing.
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

  # Public: JSON representation of the information.
  #
  # Returns the JSON representation of all the games.
  def to_json
    Jbuilder.encode do |json|
      json.array!(@games) do |game|
        json.total_kills game.total_kills
        json.players game.players, :name, :kills
      end
    end
  end

  private

  # Private: Add a game to the application.
  #
  # Returns nothing.
  def add_game
    @games << Game.new
  end

  # Private: Current game.
  #
  # Returns the last game.
  def current_game
    @games.last
  end
end