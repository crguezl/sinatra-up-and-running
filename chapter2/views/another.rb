class App 
  enable :inline_templates
  get '/' do
    erb :another
  end
end

__END__
@@another
<!DOCTYPE html>
<html> 
  <head>
    <meta charset="UTF-8">
    <title>Separated file</title> 
  </head>
  <body> 
    <h1>Inside another!</h1>
  </body> 
</html>
