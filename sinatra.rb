require 'sinatra'
require './q3stats.rb'
require './overall_ranking.rb'

get '/' do
  erb :index
end

get '/stats' do
  content_type :json

  stats = Q3Stats.new
  stats.generate
  stats.to_json
end

get '/ranking' do
  erb :ranking
end

get '/ranking.json' do
  content_type :json

  stats = Q3Stats.new
  stats.generate

  ranking = OverallRanking.new(stats.games)
  ranking.create
  ranking.to_json
end