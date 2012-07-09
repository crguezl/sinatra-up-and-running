require 'sinatra/base'

module Sinatra
  module PostGet
    def post_get(route, &block)
      get(royte, &block)
      post(route, &block)
    end
  end
end
