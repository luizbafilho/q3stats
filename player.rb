class Player
  # Public: Returns the id of the user, it is a ID grabbed from the log file.
  attr_reader :id
  # Public: Gets/Sets for the users's name and the users kills.
  attr_accessor :name, :kills, :deaths

  # Public: Initialize a Player.
  #
  # raw_player - A array which the first element is the ID and the sacond one is the name.
  def initialize raw_player
    @id = raw_player[0]
    @name = raw_player[1]
    @kills = 0
    @deaths = 0
  end

  # Public:  Increase the user kills counter.
  def add_kill
    @kills += 1
  end

  # Public:  Decrease the user kills counter.
  def remove_kill
    @kills -= 1
  end

  # Public:  Increase the user deaths counter.
  def add_death
    @deaths += 1
  end
end