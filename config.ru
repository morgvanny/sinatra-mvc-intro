require_relative './config/environment'

use Rack::MethodOverride
use BooksController
run ApplicationController
