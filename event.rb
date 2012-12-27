# Public: Represents a event occured on the games.log.
# For each relevant line that represents some event, like a game initiating,
# a new player or a player killing other player, it is created on Event Object, to
# represent this line on the application.
#
class Event
  # Public: Represents the type of the event
  # that can be: :game, :player or :kill
  attr_reader :type

  # Public: Represents relevant content grabbed by the regex in the games.log file like the the player name.
  #
  # Examples
  #
  #   # For the Player event
  #   # => [1, 'Player 1']
  #
  #   # For the  Kill event
  #   # => ['Player 1', 'Player 2', 'MOD_ROCKET']
  attr_reader :captures

  def initialize type, captures
    @type = type
    @captures = captures
  end

end
