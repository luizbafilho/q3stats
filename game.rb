class Game

  attr_accessor :total_kills, :players

  def initialize
    @total_kills = 0
    @players = []
  end

  def add_player player
    p = player_by_id(player.id)
    if !p
      @players << player
    elsif p.name != player.name
      p.name = player.name
    end
  end

  def add_kill raw_kill
    @total_kills += 1
    p = player_by_name raw_kill.first
    if p.present?
      p.add_kill
    else
      killed_player = player_by_name raw_kill.second
      killed_player.remove_kill
    end
  end

  def kills
    kills = {}

    @players.each do |player|
      kills[player.name] = player.kills
    end
    kills
  end

  private

  def player_by_id id
    @players.select {|p| p.id == id}.first
  end

  def player_by_name name
    @players.select {|p| p.name == name}.first
  end

end