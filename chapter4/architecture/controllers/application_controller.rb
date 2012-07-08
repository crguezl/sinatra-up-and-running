class Applicationcontroller < Sinatra::Base
  helpers ApplicationHelper

  set :views, File.expand_path('../../views', __FILE__)

  configure :production, :development do
    enable :logging
  end

  not_found do
    title 'Not Found!'
    erb :not_found
  end
end
