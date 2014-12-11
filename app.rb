require "sinatra"

class App < Sinatra::Application
  get "/" do
    "Hi from Sinatra"
  end

  get "/no-sleep-till" do
    til_brooklyn = ENV.fetch("ENOVA_TIMEOUT", 5).to_i
    # no
    sleep til_brooklyn
    "BROOKLYN!"
  end
end

App.run!
