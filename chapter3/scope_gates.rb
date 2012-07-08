# scope gate: sections of code where the context changes. classes, modules and methods are scope gates

require 'sinatra'

outer_self = self

get '/' do
  content_type :txt
  "outer self = #{outer_self.inspect}, inner self = #{self}\n
  self.class.superclass = #{self.class.superclass}
  method(:get) = #{method(:get).inspect}
  Sinatra::Delegator.methods(false) = #{Sinatra::Delegator.methods(false).inspect}
  Sinatra::Delegator.target = #{Sinatra::Delegator.target.inspect}
  Sinatra::Application.method(:get) = #{Sinatra::Application.method(:get).inspect}
  source_location of get = #{Sinatra::Application.method(:get).source_location}
  "
end

# outer self = main, inner self = #<Sinatra::Application:0x007fd52b8fad60>
# Method calls inside routing blocks are sent to an
# instance of the class "Sinatra::Application"
#
# If you refresh the page the object changes: there is a separated instance for 
# every request made.
# Sinatra::Application inherits from Sinatra::Base
# Sinatra::Delegator is a mixing extending Object. Methods like "get"
# and "post" are defined by Sinatra::Delegator, but it simply send the same method
# cal to Sinatra::Application which inherits from Sinatra::Base
