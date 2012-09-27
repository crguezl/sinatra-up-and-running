require 'sinatra'

set :session_secret, ENV["SESSION_KEY"] || 'too secret'

enable :sessions

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get '/' do
  erb :mainform, :locals => { :session => session }
end

post '/' do
  session[:name] = params[:name]
  redirect '/'
end

post '/clear' do
  session.clear
  redirect '/'
end

