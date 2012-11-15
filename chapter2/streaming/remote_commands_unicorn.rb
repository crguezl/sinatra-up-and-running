require 'sinatra'

get '/log' do
    content_type :txt
    IO.popen('tail -f file.log')
end
