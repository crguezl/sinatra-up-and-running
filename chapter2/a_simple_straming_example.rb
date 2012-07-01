# page 46. Example 2-37.
require 'sinatra'

before do
  content_type :txt
end


connections = []

get '/consume' do
  stream(:keep_open) do |out|
    # store connection for later on
    connections << out

    # remove connection when closed properly
    out.callback { connections.delete(out) }

    # remove connection when due to an error
    out.errback do
      logger.warn 'we just lost the connection!'
      connections.delete(out)
    end

  end # stream
end


get '/broadcast/:message' do
  connections.each do |out|
    out << "#{Time.now} -> #{params[:message]}" << "\n"
  end

  "Sent #{params[:message]} to all clients."
end

# Open a web browser and navigate to http://localhost/4567/consume
# then open a terminal and 
#   $ curl http://localhost:4567/broadcast/hello
#   Sent hello to all clients.
# Works with forefox but not chrome
