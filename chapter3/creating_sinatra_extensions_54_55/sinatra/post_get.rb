require 'sinatra/base'

module Sinatra
  module PostGet
    def post_get(route, &block)
      puts "route = #{route}"
      get(route, &block)
      post(route, &block)
    end
  end

  # now we just need to register via Sinatra::Base
  register PostGet
end
