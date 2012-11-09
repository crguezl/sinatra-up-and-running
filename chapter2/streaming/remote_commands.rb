require 'sinatra'

get '/log' do
  content_type :txt
  IO.popen('tail -f file.log') do |io|
    stream do |out|
      io.each { |s| out << s }
    end
  end
end
