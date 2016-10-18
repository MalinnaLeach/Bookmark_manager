require 'sinatra/base'
require_relative 'models/link'
class Bookmarks < Sinatra::Base
  get '/' do
    'Hello Bookmarks!'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
