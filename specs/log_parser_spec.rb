require File.join(File.dirname(__FILE__), '..', 'log_parser')

describe LogParser do
  
  describe "#initialize" do

    before(:each) do
      @parser = LogParser.new
    end
    
    it "reads all the lines on the games.log" do
      File.should_receive(:readlines)
      LogParser.new
    end

    it "returns @events size equals 0" do
      @parser.events.size.should eq(0)
    end
  end

  describe "#game?" do
    before(:each) do
      @parser = LogParser.new
    end

    it "should return true" do
      @parser.game?('12:13 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0').should be_true
    end
    
    it "should return false" do
      @parser.game?('12:13 InitGameWrong: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0').should be_true
    end

  end

  describe "#player?" do

  end

  describe "#kill?" do

  end

  describe "#captures" do

  end
  
end