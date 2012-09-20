# http://www.sinatrarb.com/intro
# Paragraph "Using Sessions"
require 'sinatra'

enable :sessions

get '/' do
    "value = " << session[:value].inspect
end

get '/:value' do
    session[:value] = params[:value]
    "value set to #{session[:value]}"
end
