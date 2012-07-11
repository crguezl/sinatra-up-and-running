require 'pp'

class InspectEnvApp
  def call(env)
    PP.pp(env, response = '')
    [200, {'Content-Type' => 'text/plain'}, [response]]
  end
end

run InspectEnvApp.new

