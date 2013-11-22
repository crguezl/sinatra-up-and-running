require 'sinatra'
require 'pp'

set :server, :thin
set :connections, []

before do
 content_type :txt
end

get '/' do
  # keep stream open
  stream(:keep_open) do |out| 
    pp out.inspect
    pp out.class
    pp out.instance_variables
    pp out.class.class_variables
    pp out.methods(false)
    settings.connections << out 
  end
end

get '/b/:message' do |b|
  # write to all open streams
  settings.connections.each do |out| 
    out << b 
   end
  "message '#{b}' sent"
end
