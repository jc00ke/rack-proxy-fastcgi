require "sinatra"

class App < Sinatra::Application
  get "/" do
    "Hi from Sinatra"
  end

  get "/timeout" do
    sleep 5
    "BROOKLYN!"
  end
end

App.run!
