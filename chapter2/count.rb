# http://www.sinatrarb.com/intro
# Paragraph "Using Sessions"
require 'sinatra'

enable :sessions

get '/' do
  puts self.class
  session[:value] = "0" if session[:value].nil?
  session[:value] = (session[:value].to_i + 1).to_s
end

