require 'sinatra/base'

NAMES = %w{juana maria blas reynaldo}
class App < Sinatra::Base
  get '/index' do 
    puts "Visiting #{request.url}"
    erb :index
  end
end

