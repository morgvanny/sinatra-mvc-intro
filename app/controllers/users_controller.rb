class UsersController < ApplicationController

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect "/books"
    else
      @error = @user.errors.full_messages[0]
      erb :"/users/new.html"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end


end
