# Example 3-10, page 57. Creating a helper via a block
#
require 'sinatra'

helpers do
  def link(name)
    case name
    when :about then '/about'
    when :index then '/index'
    else "/page/#{name}"
    end
  end
end

['/', '/index', '/index.html', '/about', '/page/:random?'].each do |x|
  get x do
    @x = x
    erb :index
  end
end

__END__

@@layout
<html>
  <body>
    <h1> route = <%= @x %> </h1>
    <h1> params = <%= params %> </h1>
    <%= yield %>
  </body>
</html>

@@index
<nav>
  <ul>
    <li><a href="<%= link(:index) %>">Index</a></li>
    <li><a href="<%= link(:about) %>">About</a></li>
    <li><a href="<%= link(:random) %>">Random</a></li>
  </ul>
</nav>


