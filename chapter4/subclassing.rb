# Subclassing Subclasses. Route inheritance. Pages 73 and 74
require 'sinatra/base'
require 'haml'

class GeneralApp < Sinatra::Base
  set :foo, 42
  set :bar, 37

  get '/' do
    haml :indexsubclassing
  end

  get '/about' do
    "This is a general app"
  end
end

class CustomApp < GeneralApp
  set :foo, 23

  get '/about' do
    "This is a custom app"
  end
end

CustomApp.run! if __FILE__ == $0

