require 'json'

# Public: Represents a overall ranking of all kills and deaths from all the games.
#
class OverallRanking

  # Public: Initialize a OverallRanking.
  #
  # games - array of games
  def initialize games
    @ranking = []
    @games = games
  end

  # Public: Creates the ranking.
  #
  # Returns nothing.
  def create
    @games.each do |game|
      game.players.each do |player|
        add_player player
      end
    end
  end

  # Public: Adds a player to the ranking.
  #
  # player -player object
  #
  # Returns nothing.
  def add_player player
    ranking_player = player_by_name(player.name)

    if ranking_player
      index = @ranking.find_index(ranking_player)
      @ranking[index][:kills] += player.kills
      @ranking[index][:deaths] += player.deaths
    else
      @ranking << {:name => player.name, :kills => player.kills, :deaths => player.deaths}
    end
  end

  # Public: Returns a JSON representations of the ranking, ordered by kills.
  #
  # Returns a json.
  def to_json
    @ranking.sort! {|x,y| y[:kills] <=> x[:kills] }
    @ranking.to_json
  end

  private

  # Private: Finds a player by name in the players array.
  #
  # name - Player name
  #
  # Returns the found player.
  def player_by_name name
    @ranking.select {|p| p[:name] == name}.first
  end
end