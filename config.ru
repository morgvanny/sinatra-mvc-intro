require_relative './config/environment'
use Rack::MethodOverride
use BooksController
use SessionsController
run ApplicationController
use UsersController
