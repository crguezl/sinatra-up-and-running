require 'sinatra'

set :title, "My Website"

# configure let's you specify env dependent options
configure :development, :test do
  # enable :key and disable :key are shortcuts for 'set :key, true'
  # and 'set :key, false' respectively
  enable :admin_access
end

if settings.admin_access?
  get('/admin') { '<h1>Welcome to the Admin area!</h1>'}
end

get '/' do
  <<"EOS"
   <h1>#{settings.title}</h1>
   <ul>
   <li>settings.absolute_redirects = #{settings.absolute_redirects}
   <li>settings.app_file = #{settings.app_file}
   <li>settings.bind = #{settings.bind}
   <li>settings.default_encoding = #{settings.default_encoding}
   <li>settings.environment = #{settings.environment}
   <li>settings.protection = #{settings.protection}
   <li>settings.root = #{settings.root}
   <li>settings.sessions = #{settings.sessions}
   <li>settings.threaded = #{settings.threaded}
   <li>settings.views = #{settings.views}
   </ul>

EOS
end
