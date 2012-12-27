require File.join(File.dirname(__FILE__), '..', 'q3stats')
require 'json'

describe Q3Stats do

  describe "#initialize" do

    it 'Parses the games.log file and return the events' do
      LogParser.any_instance.should_receive(:parse)
      @stats = Q3Stats.new
    end

  end

  describe "#generate" do
    it 'creates the games' do
      File.stub(:readlines).and_return(['12:13 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv...'])
      @stats = Q3Stats.new
      @stats.should_receive(:add_game).once
      @stats.generate
    end

    it 'creates the players' do
      File.stub(:readlines).and_return(['12:14 ClientUserinfoChanged: 2 n\Dono da Bola\t\0\model\sarge\hm...'])
      @stats = Q3Stats.new
      @game = Game.new
      @stats.stub(:current_game).and_return(@game)
      @game.should_receive(:add_player).once
      @stats.generate
    end

    it 'creates the kills' do
      File.stub(:readlines).and_return(['12:24 Kill: 3 4 6: Isgalamido killed Zeh by MOD_ROCKET'])
      @stats = Q3Stats.new
      @game = Game.new
      @stats.stub(:current_game).and_return(@game)
      @game.should_receive(:add_kill).once
      @stats.generate
    end
  end

  describe "#to_json" do

    it 'returns the proper json' do
      File.stub(:readlines).and_return(
        [ '12:13 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv...',
          '12:14 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\sarge\hm...',
          '12:24 Kill: 3 4 6: Isgalamido killed Zeh by MOD_ROCKET'
        ])
        @stats = Q3Stats.new
        @stats.generate
        puts @stats.to_json.class
        @stats.to_json.should eq([
          {
            "total_kills" => 1,
            "players" => ["Isgalamido"],
            "kills" => [
              {
                "name" => "Isgalamido",
                "kills" => 1
              }
            ]
          }
        ].to_json)
    end
  end

end