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
    before(:each) do
      @parser = LogParser.new
    end

    it "should return true" do
      @parser.player?('2:14 ClientUserinfoChanged: 2 n\Dono da Bola\t\0\model\sarge\hmodel\sarge').should be_true
    end

    it "should return false" do
      @parser.player?('2:14 ClientUserinfoChanged: 2 n\Dono da Bola\t\0\model\sarge\hmodel\sarge').should be_true
    end
  end

  describe "#kill?" do
    before(:each) do
      @parser = LogParser.new
    end

    it "should return true" do
      @parser.kill?('12:24 Kill: 3 4 6: Isgalamido killed Zeh by MOD_ROCKET').should be_true
    end

    it "should return false" do
      @parser.kill?('12:24 Kill: 3 4 6: Isgalamido killed Zeh by MOD_ROCKET').should be_true
    end
  end

  describe "#captures" do
    it 'returns the captures from the match' do
      @parser = LogParser.new
      @parser.kill?('12:24 Kill: 3 4 6: Isgalamido killed Zeh by MOD_ROCKET')
      @parser.captures.should eq(['Isgalamido', 'Zeh', 'MOD_ROCKET'])
    end
  end
end