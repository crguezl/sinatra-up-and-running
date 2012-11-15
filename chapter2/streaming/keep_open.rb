require 'sinatra'

set :server, :thin
set :connections, []

before do
 content_type :txt
end

get '/' do
  # keep stream open
  stream(:keep_open) do |out| 
    puts out.inspect
    puts out.class
    puts out.instance_variables
    puts out.class.class_variables
    puts out.methods(false)
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
