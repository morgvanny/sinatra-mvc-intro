class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "8bc8c3d321223b8205514ae212344bef609a33d8775be9398d942a989bc443a7970f69cab062f50593d6cfeccc249463fd231a8590c8dc2dcee6cab5f6419931"
    set :views, './app/views'
    helpers Sinatra::Cookies
  end

  get '/' do
    @color = session[:color]
    erb :index
  end

  get '/red' do
    session[:color] = 'red'
    "The color cookie has been set to red"
  end

  get '/blue' do
    session[:color] = 'blue'
    "The color cookie has been set to blue"
  end

end
