require 'sinatra/base'

module MyExtension

  module Helpers
    def link(name)
      case name
      when :about then '/about'
      when :index then '/index'
      else "/page/#{name}"
      end
    end
  end

  # extension methods go here
  def post_get(route, &block)
    puts "route = #{route}"
    get(route, &block)
    post(route, &block)
  end

  def self.registered(app)
    app.helpers Helpers
  end
end

Sinatra.register MyExtension
