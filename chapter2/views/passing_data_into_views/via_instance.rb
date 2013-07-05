require 'sinatra/base'


class App < Sinatra::Base
  get '/*' do |name|
    def some_template
       <<-'HAMLTEMP'
%o
  - @foo.each do |item|
    %li 
      %i #{item}
HAMLTEMP
    end
    puts "*---***#{name}*---****"
    @foo = name.split('/')
    haml some_template
  end
end
