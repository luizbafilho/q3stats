class Player
  attr_reader :id
  attr_accessor :name, :kills

  def initialize raw_player
    @id = raw_player[0]
    @name = raw_player[1]
    @kills = 0
  end

  def add_kill
    @kills += 1
  end

  def remove_kill
    @kills -= 1
  end

end