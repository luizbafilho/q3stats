require 'sinatra'
require './q3stats.rb'

get '/' do
  erb :index
end

get '/stats' do
  content_type :json

  q = Q3Stats.new
  q.generate
  q.to_json
end