# coding: utf-8
# page 46. Example 2-37.
require 'sinatra'

before do
  content_type :txt
end

set server: 'thin', connections: []

get '/consume' do
  stream(:keep_open) do |out|
    # store connection for later on
    settings.connections << out

    # remove connection when closed properly
    out.callback { settings.connections.delete(out) }

    # remove connection when due to an error
    out.errback do
      logger.warn 'we just lost the connection!'
      settings.connections.delete(out)
    end

  end # stream
end


get '/broadcast/:message' do
  settings.connections.each do |out|
    out << "#{Time.now} -> #{params[:message]}" << "\n"
  end

  "Sent #{params[:message]} to all clients."
end

# Open a web browser and navigate to http://localhost/4567/consume
# then open a terminal and 
#   $ curl http://localhost:4567/broadcast/hello
#   Sent hello to all clients.
# Works with forefox but not chrome
