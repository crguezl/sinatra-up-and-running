require 'sinatra'

# before we process a route we'll set the response as plain text
# and set up an array of viable moves that a player (and the
# computer) can perform
before do
  content_type :txt
  @defeat = { rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeats.keys
end

get '/throw/.type' do
  
end
