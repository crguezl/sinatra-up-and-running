require 'sinatra'

# before we process a route we'll set the response as plain text
# and set up an array of viable moves that a player (and the
# computer) can perform
before do
  content_type :txt
  @defeat = { rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
end

get '/throw/:type' do
  # the params hash stores querystring and form data
  player_throw = params[:type].to_sym

  halt(403, "You must throw one of the following: '#{@throws.join(', ')}'") unless @throws.include? player_throw

  computer_throw = @throws.sample

  if player_throw == computer_throw 
    "Computer chooses: #{computer_throw}. There is a tie"
  elsif player_throw = @defeat[computer_throw]
    "Computer wins; #{computer_throw} defeats #{player_throw}"
  else
    "Well done. #{player_throw} beats #{computer_throw}"
  end
end
