# PoC Puma/FastCGI

## Setup

```
$ chruby 1.8.7
$ ./setup
$ chruby 2.1.2
$ bundle
```

To run the proof-of-concept apps:

Terminal 1
```
$ ruby app.rb -s Puma
```
Terminal 2
```
$ rackup
```

Then hit `localhost:9292/poc` for successful proxy req and
`localhost:9292/poc/timeout` for request that'll time out.
This req will return `200`.

## Proxy to Rails running in FastCGI

```
$ cd app/
$ lighttpd -D -f config/lighttpd.conf
```

Now you can hit `localhost:9292/rails` to get the homepage and
`localhost:9292/rails/timeout` for the request that'll time out.
This req will also return a `200`.

## Other Ideas

* Rewrite [mongrel/rails.rb](https://github.com/mongrel/mongrel/blob/master/lib/mongrel/rails.rb)
  handler to use rack instead of Mongrel. (from Evan)

### Notes

* Rails 1.2 is not threadsafe, and can't handle more than 1 concurrent req
  at a time.

