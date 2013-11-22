require 'sinatra'

before do
  content_type :txt
end

set server: 'thin', connections: []

get '/consume' do
  stream(:keep_open) do |out|
    # store connection for later on
    settings.connections << out
    logger.warn "connections.length = #{settings.connections.length}"

    # remove connection when closed properly
    out.callback do 
      logger.warn "connection closed. out = #{out}"
      settings.connections.delete(out) 
      logger.warn "connections.length = #{settings.connections.length}"
    end

    # remove connection when due to an error
    out.errback do
      logger.warn "we just lost  connection!. out = #{out}"
      settings.connections.delete(out)
      logger.warn "connections.length = #{settings.connections.length}"
    end
  end # stream
end


get '/produce/:message' do
  settings.connections.each do |out|
    out << "#{Time.now} -> #{params[:message]}" << "\n"
  end

  "Sent #{params[:message]} to all clients."
end

