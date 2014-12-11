require "rack"
require "rack-timeout"
require "rack/reverse_proxy"
require "rack/robustness"

builder = Rack::Builder.new do
  use Rack::Timeout
  Rack::Timeout.timeout = 2

  use Rack::Robustness do |g|
    g.no_catch_all

    g.on(Rack::Timeout::RequestTimeoutError){ |ex| 200 }
    g.content_type 'text/plain'
    g.body{ |ex| ex.message }

    g.ensure(true){ |ex|
      env['rack.errors'].write(ex.message)
    }
  end

  use Rack::ReverseProxy do
    reverse_proxy(/\A\/rails(.*)\z/,  "http://127.0.0.1:3000$1")
    reverse_proxy(/\A\/poc(.*)\z/,    "http://127.0.0.1:4567$1")
  end

  map '/' do
    run ->(env) {
      [ 200,
        {'Content-Type' => 'text/plain'},
        [ 'foo' ] ]
    }
  end
end

run builder


