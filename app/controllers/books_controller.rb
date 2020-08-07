class BooksController < ApplicationController
  get '/books' do
    redirect_if_logged_out
    @books = current_user.books
    erb :'books/index'
  end

  get '/books/new' do
    redirect_if_logged_out
    @book = Book.new
    erb :'books/new'
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect to '/books'
    end
    erb :'books/show'
  end

  get '/books/:id/edit' do
    @book = Book.find(params[:id])
    if @book.user == current_user
      erb :'books/edit'
    else
      redirect to '/books'
    end
  end

  post '/books' do
    redirect_if_logged_out
    @book = current_user.books.build(params)
    if @book.save
      # redirect to "/books/#{@book.id}"
      erb :'books/show'
    else
      @error = @book.errors.full_messages.first
      erb :'books/new'
    end
  end

  patch '/books/:id' do
    @book = Book.find(params[:id])
    params.delete(:_method)
     #mass assignment can be dangerous if you don't sanitize params
    if @book.user != current_user
      redirect to '/books'
    elsif @book.update(params)
      redirect to "/books/#{@book.id}"
    else
      @error = @book.errors.full_messages.first
      erb :'books/edit'
    end
  end

  delete '/books/:id' do
    @book = Book.find(params[:id])
    @book.destroy if @book.user == current_user
    redirect to '/books'
  end
end
