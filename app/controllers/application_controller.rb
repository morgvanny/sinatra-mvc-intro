class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    set :views, './app/views'
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
