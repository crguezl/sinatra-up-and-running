# http://www.sinatrarb.com/contrib/streaming.html
require 'sinatra'
set server: 'thin'

get '/' do
  stream do |out|
    out.puts "Hello World!", "How are you?"
    out.write "Written #{out.pos} bytes so far!\n"
    out.putc(65) unless out.closed?
    out.flush
  end
end
