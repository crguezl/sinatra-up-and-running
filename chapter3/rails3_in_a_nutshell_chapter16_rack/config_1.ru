class RailsNutshellApp
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, []]
  end
end

run RailsNutshellApp.new
