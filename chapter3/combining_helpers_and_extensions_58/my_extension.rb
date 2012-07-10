# If we want to create a Sinatra extemsion that ships with a helper 
# we can do it registering the Helpers submodule via declaring
# the class method "registered". The method takes the application class 
# as only argument.
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
    puts "Inside self.registered. app = #{app.inspect}"
    app.helpers Helpers
  end
end

Sinatra.register MyExtension
