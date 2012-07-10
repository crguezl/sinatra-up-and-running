# Creating Sinatra Extensions
# pages 54-55
$LOAD_PATH << '.'
require 'sinatra'
require 'sinatra/post_get'
require 'haml'

post_get '/:zz?' do
  haml :index
end
__END__
@@layout
%html
  %body
    = yield

@@index
%h1 Hello world!!!!! #{params}
%form{ :action => "/", :method => "post"}
  %fieldset
    %input{:type => "text", :name => ":tati", :class => "text"}
    %input{:type => "submit", :value => "Send", :class => "button"}
