require './event.rb'

# Public: Parses the games.log file and creates multiples events to represents the file content.
class LogParser

  # Public: Array of events the represents the log content. This events can be games, playes or kills.
  attr_reader :events

  # Public: Reads the game.log file and initilize the @events variable.
  def initialize
    @log_lines = File.readlines('logs/games.log')
    @events = []
  end


  # Public: Creates the events acording to the games.log line and add this event to the array.
  #
  # Returns the events array.
  def parse
    @log_lines.each do |line|
      if game? line
        Event.new(:game, captures)
      elsif player? line
        Event.new(:player, captures)
      elsif kill? line
        Event.new(:kill, captures)
      end.tap{ |event|
        @events << event if event
      }
    end
    @events
  end

  # Public: Verifies if the line represents a game.
  #
  # line -games.log line.
  #
  # Returns boolean.
  def game? line
    line.match(/InitGame/) ? true : false
  end

  # Public: Verifies if the line represents a player.
  #
  # line - games.log line.
  #
  # Returns boolean.
  def player? line
    @current_match = line.match(/ClientUserinfoChanged:\s(\d)\sn\\(.*)\\t\\/)
    @current_match ? true : false
  end

  # Public: Verifies if the line represents a kill.
  #
  # line - games.log line.
  #
  # Returns boolean.
  def kill? line
    @current_match = line.match(/Kill:\s.*:\s(.*)\skilled\s(.*)\sby\s(.*)/)
    @current_match ? true : false
  end

  # Public: Relevant data grabbed by the regex.
  #
  # line - games.log line.
  #
  # Examples
  #
  #   # => ['Player 1', 'Player 2', 'MOD_ROCKET']
  #
  # Returns the data returned by the matched regex.
  def captures
    @current_match.captures if @current_match
  end
end