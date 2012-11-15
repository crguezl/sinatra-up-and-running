# http://stackoverflow.com/questions/7684784/stream-console-output-through-http-with-ruby
require 'sinatra'

before do
  content_type :txt
end

get '/log' do
  content_type :txt
  IO.popen('cat file.log') do |io|
    stream(:keep_open) do |out|
      io.each do |s| 
        puts s
        out << s 
      end
    end
  end
end
