class Game
  # Public: Gets/Sets total_kills and players.
  attr_accessor :total_kills, :players

  # Public: Initialize a Game.
  def initialize
    @total_kills = 0
    @players = []
  end

  # Public: Adds the user to the players array
  #
  # player - Player object
  def add_player player
    p = player_by_id(player.id)
    if !p
      @players << player
    elsif p.name != player.name
      p.name = player.name
    end
  end

  # Public: Adds a kill to the killer and a death to the dead player. If the killer is the <world> then the player
  # gets one kill removed.
  #
  # raw_kill - Raw data returned by the regex match
  #
  # Examples
  #
  #    add_kill(['Player 1', 'Player 2', 'MOD_ROCKET'])
  #
  def add_kill raw_kill
    @total_kills += 1

    killer = player_by_name raw_kill[0]
    dead   = player_by_name raw_kill[1]

    killer ? killer.add_kill : dead.remove_kill
    
    dead.add_death
  end

  private

  # Private: Finds a user by ID in the players array.
  #
  # id - Player ID
  #
  # Returns the found user.
  def player_by_id id
    @players.select {|p| p.id == id}.first
  end

  # Private: Finds a user by name in the players array.
  #
  # name - Player name
  #
  # Returns the found user.
  def player_by_name name
    @players.select {|p| p.name == name}.first
  end
end