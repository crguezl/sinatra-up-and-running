require 'sinatra'
require 'rack'

# Rack::Runtime  is a middleware that ships with Rack 
# and sets the X-Runtime header.
# Rack::Runtime calculates the time the request took
# to process.
use Rack::Runtime

get('/') do
  '"Hello world!"'
end

# [19:56][~/src/ruby/sinatra/sinatraupandrunning/chapter3/rack_it_up(master)]$ curl -I 0.0.0.0:4567
# HTTP/1.1 200 OK
# X-Frame-Options: sameorigin
# X-XSS-Protection: 1; mode=block
# Content-Type: text/html;charset=utf-8
# Content-Length: 14
# X-Runtime: 0.027618
# Connection: keep-alive
# Server: thin 1.3.1 codename Triple Espresso

