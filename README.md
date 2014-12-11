# PoC Puma/FastCGI

## Ideas

* Get simple Sinatra app to run via FastCGI
* Figure out how to proxy that app through Puma
* Rewrite [mongrel/rails.rb](https://github.com/mongrel/mongrel/blob/master/lib/mongrel/rails.rb)
  handler to use rack instead of Mongrel.
* Look into Cherokee, see if there's something there

### Notes

* Rails 1.2 is not threadsafe, and can't handle more than 1 concurrent req
  at a time.

## Setup

```
bundle
```

## Run

### Puma

```
$ bundle exec rackup -s Puma app.rb
```

### FastCGI

```
$ ./dispatch.fcgi
```

## Resources

* [Sinatra + FastCGI](http://recipes.sinatrarb.com/p/deployment/fastcgi)
* [Rack Handlers](https://github.com/rack/rack/tree/master/lib/rack/handler)
* [Rack::Handler::LSWS](http://www.rubydoc.info/github/rack/rack/Rack/Handler/LSWS)


