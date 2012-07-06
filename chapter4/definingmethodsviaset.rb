require 'sinatra/base'
require 'haml'

class MyApp < Sinatra::Base
    set :foo, 42
    set(:bar) do |x|
      x+1
    end

    get '/' do
      haml :index
    end

    run! if __FILE__ == $0
end

__END__

