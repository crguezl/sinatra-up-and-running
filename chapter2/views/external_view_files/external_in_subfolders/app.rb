require 'sinatra/base'

class App < Sinatra::Base
  get '/:user/profile' do |user|
    @user = user
    erb '/user/profile'.to_sym
  end

  get '/:user/help' do |user|
    @user = user
    erb :'/user/help'
  end
end
