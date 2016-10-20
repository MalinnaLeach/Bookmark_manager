require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/data_mapper_setup'

  ENV['RACK_ENV'] ||= 'development'

  DataMapper.finalize

class Bookmarks < Sinatra::Base

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
      params[:tag].split.each do |tag|
        LinkTag.create(:link =>link, :tag => Tag.create(tag_name: tag))
      end
      redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(tag_name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
