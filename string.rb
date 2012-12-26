class String
  def game?
    self.match(/InitGame/) ? true : false
  end

  def player?
    @player = self.match(/ClientUserinfoChanged:\s(\d)\sn\\(.*)\\t\\/)
    @player ? true : false
  end

  def raw_player
    @player.captures
  end

  def kill?
    @kill = self.match(/Kill:\s.*:\s(.*)\skilled\s(.*)\sby\s(.*)/)
    @kill ? true : false
  end

  def raw_kill
    @kill.captures
  end
end