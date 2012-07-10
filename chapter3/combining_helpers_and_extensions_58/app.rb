# Combining Helpers and Extensions. Page 58
# pages 54-55
$LOAD_PATH << '.'
require 'sinatra'
require 'my_extension'
require 'haml'

post_get '/:zz?' do
  haml :index
end

get '/page/:random' do
  "Random #{params}"
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
    %a(href = "#{link(:index)}") index
  %li
    %a(href = "#{link(:about)}") about
  %li
    -# We can insert HTML inside Haml, and sometimes is the best you can do
    <a href="#{link(:random)}">random</a>

%form{ :action => "/", :method => "post"}
  %fieldset
    %input{:type => "text", :name => ":tati", :class => "text"}
    %input{:type => "submit", :value => "Send", :class => "button"}
