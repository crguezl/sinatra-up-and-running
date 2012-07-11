MyApp = proc do |env|
  [200, {'Content-Type' => 'text/plain'}, [ 'ok' ]]
end

class MiddleWare
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "env:"

    if env['PATH_INFO'] =~ %r{^/a*$}
      @app.call(env)
    else
      [404, {'Content-Type' => 'text/plain'}, ['not ok']]
    end
  end
end

use MiddleWare
run MyApp
