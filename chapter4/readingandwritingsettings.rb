require 'sinatra'

set :title, "My Website"

# configure let's you specify env dependent options
configure :development, :test do
  # enable :key and disable :key are shortcuts for 'set :key, true'
  # and 'set :key, false' respectively
  enable :admin_access
end

if settings.admin_access?
  get('/admin') { '<h1>Welcome to the Admin area!</h1>'}
end

get '/' do
  "<h1>#{settings.title}</h1>"
end
