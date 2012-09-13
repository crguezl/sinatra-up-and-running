task :default => :rps

desc "Run rps_with_sinatra.rb with ruby. Visit localhost//throw/scissors"
task :rps do
  sh "ruby -I. rps_with_sinatra.rb"
end

desc "Run rps_with_sinatra.rb with shotgun"
task :shotgun do
  sh "shotgun -I. rps_with_sinatra.rb"
end

desc "telnet 0.0.0.0 4567" 
# Give this input (2 carriage returns at the end):
# GET /throw/scissors HTTP/1.1
# Host: 0.0.0.0
# 
#
task :telnet do
  sh "telnet 0.0.0.0 4567"
end

desc "makes a tar.gz with the files"
task :tar do
  sh "tar  cvzf rockpaperscissors.tar.gz *.rb README Rakefile inputfortelnet"
end

