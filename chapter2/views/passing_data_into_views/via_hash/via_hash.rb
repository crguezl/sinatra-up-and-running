require 'sinatra/base'

class App < Sinatra::Base
  get '/*' do |name|
    def some_template
       <<-'ERBTEMP'
<ul><% name.each do |item| %>
      <li> <i> <%= item %> </i> </li>
    <% end %>
</ul>
ERBTEMP
    end # method some_template

    puts "*---***#{name}*---****"
    erb some_template, :locals => { :name => name.split('/')}
  end
end
