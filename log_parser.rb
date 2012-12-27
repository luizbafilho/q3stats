require './event.rb'

class LogParser

  attr_reader :events

  def initialize
    @log_lines = File.readlines('logs/games.log')
    @events = []
  end

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

  def game? line
    line.match(/InitGame/) ? true : false
  end

  def player? line
    @current_match = line.match(/ClientUserinfoChanged:\s(\d)\sn\\(.*)\\t\\/)
    @current_match ? true : false
  end

  def kill? line
    @current_match = line.match(/Kill:\s.*:\s(.*)\skilled\s(.*)\sby\s(.*)/)
    @current_match ? true : false
  end

  def captures
    @current_match.captures if @current_match
  end
end