require 'pp'
require 'zlib'

require 'rack/request'
require 'rack/response'

module Rack
  # Paste has a Pony, Rack has a Lobster!
  class Lobster
    LobsterString = Zlib::Inflate.inflate("eJx9kEEOwyAMBO99xd7MAcytUhPlJyj2
    P6jy9i4k9EQyGAnBarEXeCBqSkntNXsi/
    ZCvC48zGQoZKikGrFMZvgS5ZHd+aGWVuWwhVF0
    t1drVmiR42HcWNz5w3QanT+2gIvTVCi
    E1lm1Y0eU4JGmIIbaKwextKn8rvW+p5PIwFl8ZWJ
    I8jyiTlhTcYXkekJAzTyYN6E08A+dk8voBkAVTJQ==".delete("\n ").unpack("m*")[0])

    puts LobsterString

    def call(env)
      puts "env:"
      PP.pp(env)
      req = Request.new(env)
      puts "request:"
      PP.pp req
      if req.GET["flip"] == "left"
        lobster = LobsterString.split("\n").
          map { |line| line.ljust(42).reverse }.
          join("\n")
        puts lobster
        href = "?flip=right"
      elsif req.GET["flip"] == "crash"
        raise "Lobster crashed"
      else 
        lobster = LobsterString
        href = "?flip=left"
      end

      res = Response.new
      res.write drawlobster(lobster, href)
      res.finish

      puts "response:"
      PP.pp res

      res
    end

    def drawlobster(lobster, href)
      <<-"LOBSTER"
        <title>Lobstericious!</title>
        <pre>
#{lobster}
        </pre>
        <p><a href='#{href}'>flip!</a></p>
        <p><a href='?flip=crash'>crash!</a></p>
        LOBSTER
    end
  end # class Lobster
end   # module Rack

if $0 == __FILE__
  require 'rack'
  require 'rack/showexceptions'
  Rack::Handler::WEBrick.run \
    Rack::ShowExceptions.new(Rack::Lint.new(Rack::Lobster.new)),
    :Port => 9292
end
