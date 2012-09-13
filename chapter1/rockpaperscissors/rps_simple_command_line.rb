defeat = { :rock => :scissors, :paper => :rock, :scissors => :paper}
throws = defeat.keys

player_throw = (ARGV.shift || '').to_sym

raise ScriptError, "You must execute: ''#{$0}'' followed by one of the following '#{throws.join(', ')}'" unless throws.include? player_throw

computer_throw = throws.sample

if player_throw == computer_throw 
  answer = "There is a tie"
elsif player_throw == defeat[computer_throw]
  answer = "Computer wins; #{computer_throw} defeats #{player_throw}"
else
  answer = "Well done. #{player_throw} beats #{computer_throw}"
end
puts answer
