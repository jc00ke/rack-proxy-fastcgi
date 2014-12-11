class WelcomeController < ActionController::Base
  def home
    render :text => "Rails app home"
  end

  def timeout
    sleep 5
    render :text => "I waited 5s"
  end
end
