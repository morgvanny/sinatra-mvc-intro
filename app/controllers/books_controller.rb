class BooksController < ApplicationController
  get '/books' do
    if session[:user_id]
      @books = Book.all
      erb :index
    else
      redirect '/'
    end
  end

  get '/books/new' do
    erb :new
  end

  post '/books' do
    book = Book.create(params)
    redirect URI.escape("/books/#{book.title}")
  end

  get '/books/:title' do
    @book = Book.find_by_title(params[:title])
    erb :show
  end

  get '/books/:title/edit' do
    @book = Book.find_by_title(params[:title])
    erb :edit
  end

  patch '/books/:title' do
    book = Book.find_by_title(params[:title])
    book.update(params[:book])
    redirect URI.escape("/books/#{book.title}")
  end

  patch '/books/:title/like' do
    book = Book.find_by_title(params[:title])
    book.likes += 1
    book.save
    redirect '/books'
  end

  delete '/books/:id/delete' do
    book = Book.find(params[:id])
    book.delete
    redirect '/books'
  end
end