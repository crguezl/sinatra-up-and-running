require 'pp'

MyApp = proc do |env|
   puts "env in MyApp:"
   PP.pp(env)
   puts "====================================="

  [200, {'Content-Type' => 'text/html'}, [ '<h1>ok</h1>' ]]
end

class MiddleWare
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "env in MiddleWare:"
    PP.pp(env)
    puts "*************************************"

    if env['PATH_INFO'] =~ %r{^/a*$}
      env['PATH_INFO'].upcase!
      @app.call(env)
    else
      [404, {'Content-Type' => 'text/html'}, ['<h1>not ok</h1>']]
    end
  end
end

# Add class MiddleWare to rack middleware/pipeline
use MiddleWare
# run the rack app
run MyApp
