# To make a helper from a module we call "helpers Module"
# Helpers are available both in the block we pass to the·
# route and the view template itself
#

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
