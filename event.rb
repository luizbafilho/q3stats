class Event

  attr_reader :type, :captures

  def initialize type, captures
    @type = type
    @captures = captures
  end

end
