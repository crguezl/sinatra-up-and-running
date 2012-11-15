# http://www.sinatrarb.com/contrib/streaming.html
# # can't make it work
# $ gem install sinatra-contrib
require 'sinatra'
require 'sinatra/streaming'
set server: 'thin'
#set server: 'unicorn'

get '/' do
  stream do |out|
    put out.methods
    out.puts "Hello World!", "How are you?"
    out.write "Written #{out.pos} bytes so far!\n"
    out.putc(65) unless out.closed?
    out.flush
  end
end
