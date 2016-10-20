require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'models/data_mapper_setup'

  ENV['RACK_ENV'] ||= 'development'

  DataMapper.finalize

class Bookmarks < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/sign-up' do
    # need to create a Password model, create the password first, then pass that into the User below
    user = User.create(email: params[:email], password: (encrypt_password(params[:password])))
    redirect "/welcome/#{params[:email]}"
  end

  get '/welcome/:email' do
    :email
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
