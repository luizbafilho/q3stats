require 'json'

class OverallRanking

  def initialize games
    @ranking = []
    @games = games
  end

  def create
    @games.each do |game|
      game.players.each do |player|
        add_player player
      end 
    end
  end

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

  def to_json
    @ranking.sort! {|x,y| y[:kills] <=> x[:kills] }
    @ranking.to_json
  end

  private

  # def method_missing(name, *args)
  #   match = name.to_s.match(/create_by_(kills|deaths)/)
  #   if match
  #     @type = match.captures[0].to_sym
  #     create
  #   else
  #     super
  #   end
  # end

  # Private: Finds a player by name in the players array.
  #
  # name - Player name
  #
  # Returns the found player.
  def player_by_name name
    @ranking.select {|p| p[:name] == name}.first
  end
end