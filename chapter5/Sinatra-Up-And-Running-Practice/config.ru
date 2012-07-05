$LOAD_PATH.unshift 'lib'

# this is optional
require 'rack/cache'
use Rack::Cache

require 'blog'
run Blog
