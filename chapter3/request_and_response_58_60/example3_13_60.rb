# Page 60. Example 3-13: Using env, request, and response in Sinatra
# Sinatra wraps the "env" hash in an object which is available 
# inside our code in the form of the "request" object

require 'sinatra'


  get '/:x?' do
    @final_result = response.finish
    haml :index
  end

__END__
@@layout
%html
  %body
    = yield

@@index
%h1 params = #{params}
%ul
  %li 
    env['PATH_INFO'] = #{env['PATH_INFO']}
  %li
    request.path_info = #{request.path_info}
  %li
    -#<a href="#{link(:random)}">random</a>
    response.finish = #{@final_result}
  %li
    -# 3
    response.finish.length = #{@final_result.length} 
  %li
    response.finish.first = #{@final_result.first}

