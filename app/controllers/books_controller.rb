class BooksController < ApplicationController
  get '/books' do
    @books = Book.all
    erb :'books/index'
  end

  get '/books/new' do
    @book = Book.new
    erb :'books/new'
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'books/show'
  end

  get '/books/:id/edit' do
    @book = Book.find(params[:id])
    erb :'books/edit'
  end

  post '/books' do
    @book = Book.new(params)
    if @book.save
      redirect to "/books/#{@book.id}"
    else
      @error = @book.errors.full_messages.first
      erb :'books/new'
    end
  end

  patch '/books/:id' do
    @book = Book.find(params[:id])
    params.delete(:_method)
     #mass assignment can be dangerous if you don't sanitize params
    if @book.update(params)
      redirect to "/books/#{@book.id}"
    else
      @error = @book.errors.full_messages.first
      erb :'books/edit'
    end
  end

  delete '/books/:id' do
    @book = Book.find(params[:id])
    @book.destroy
    redirect to '/books'
  end
end
