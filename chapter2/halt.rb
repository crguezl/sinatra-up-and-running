require 'sinatra'

get '/halt' do
  'You will not see this output'
  halt 500, "Vaya, que problema!"
end
