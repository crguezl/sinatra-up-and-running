require 'sinatra'
require './sinatra/link_helper'

get '/' do
  erb :index
end

get '/about' do
  "About"
end

get '/index' do
  "Index"
end

get '/page/:random' do
  "Random #{params}"
end
