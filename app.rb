require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'

DataMapper.finalize
DataMapper.auto_upgrade!

class Bookmarks < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'

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
      link = Link.create(url: params[:url], title: params[:title])
      tag = Tag.create(tag_name: params[:tag])
      LinkTag.create(:link =>link, :tag => tag)
      redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
