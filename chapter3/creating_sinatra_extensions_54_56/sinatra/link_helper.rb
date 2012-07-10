require 'sinatra/base'

module Sinatra
  module LinkHelper
    def link(name)
      case name
      when :about then '/about'
      when :index then '/index'
      else "/page/#{name}"
      end
    end
  end

  helpers LinkHelper
end
