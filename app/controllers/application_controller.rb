class ApplicationController < Sinatra::Base
  set :views, 'app/views'
  set :method_override, true
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :home
  end


  post '/login' do
    user = User.find_by_username(params[:user][:username])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/books'
    else
      redirect '/'
    end
  end

end

# edit route, update route, delete route
