# http://www.sinatrarb.com/contrib/streaming.html
# $ gem install sinatra-contrib
require 'sinatra'
require 'sinatra/streaming'
set server: 'thin'
#set server: 'unicorn'

before do
  content_type :txt
end

get '/' do
  stream do |out|
    puts out.class
    out.puts "Hello World!", "How are you?"
    sleep 1
    out.write "Written #{out.pos} bytes so far!\n"
    sleep 1
    out.putc(65) unless out.closed?
    sleep 1
    out.puts "\nEnd of the Story"
    out.flush
  end
end
