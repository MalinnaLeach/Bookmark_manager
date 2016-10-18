require 'sinatra/base'
require_relative 'models/link'

class Bookmarks < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'

  configure :development do
    DataMapper.setup(:default, "postgres://localhost/bookmark_manager_development")
  end

  configure :test do
    DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
  end

  get '/' do
    'Hello Bookmarks!'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
      Link.create(url: params[:url], title: params[:title])
      redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
