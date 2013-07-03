require 'sinatra/base'

class App < Sinatra::Base
  get '/:user/profile' do
    erb '/user/profile'.to_sym
  end

  get '/:user/help' do 
    erb :'/user/help'
  end
end
