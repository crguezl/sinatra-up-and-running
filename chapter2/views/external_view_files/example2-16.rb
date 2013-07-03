require 'sinatra/base'

class App < Sinatra::Base
  get '/index' do 
    puts "Visiting #{request.url}"
    erb :index
  end
end

