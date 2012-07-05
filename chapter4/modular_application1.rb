# page 70, Examples 4-3 and 4-4
require "sinatra/base"

class MyApp < sinatra::Base
  get '/' do
    "Hello from MyApp!"
  end

  run! if __FILE__ == $0
end
