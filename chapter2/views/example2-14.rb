#require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Base
  enable :inline_templates
  get '/index' do 
    puts "Visiting #{request.url}"
    erb :index
  end
end

require './another'
__END__
@@index
<!DOCTYPE html>
<html> 
  <head>
    <meta charset="UTF-8">
    <title>Inline template</title> 
  </head>
  <body> 
    <h1>Worked!</h1>
  </body> 
</html>
