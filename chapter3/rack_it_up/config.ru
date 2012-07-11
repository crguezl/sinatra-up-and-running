MyApp = proc do |env|
   puts "env in MyApp:"
   env.keys.sort.each do |k|
     puts "#{k} => #{env[k]}"
   end
   puts "====================================="

  [200, {'Content-Type' => 'text/html'}, [ '<h1>ok</h1>' ]]
end

class MiddleWare
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "env in MiddleWare:"
    env.keys.sort.each do |k|
      puts "#{k} => #{env[k]}"
    end
    puts "*************************************"

    if env['PATH_INFO'] =~ %r{^/a*$}
      env['PATH_INFO'].upcase!
      @app.call(env)
    else
      [404, {'Content-Type' => 'text/html'}, ['<h1>not ok</h1>']]
    end
  end
end

use MiddleWare
run MyApp
