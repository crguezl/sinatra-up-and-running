require 'sinatra'
require 'rack'

use Rack::Runtime

get('/') do
  '"Hello world!"'
end
