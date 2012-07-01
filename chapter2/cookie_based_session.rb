# pages 42 and 43
# examples 2-33 using cookie-based session management
# and example 2-34 Destroying a session using session.clear
# A cookie named rack.session is stored client-side and used
# to house data related to the activity in the current user's session

require 'sinatra'

configure do
  enable :sessions
end

before do
  content_type :text
end

get '/set' do
  session[:foo] = Time.now
  "Session value set to #{session[:foo]}."
end

get '/fetch' do
  "Session value: #{session[:foo]}"
end

get '/logout' do
  session.clear
  redirect '/fetch'
end
