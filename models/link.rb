require 'dm-migrations'
require 'dm-postgres-adapter'
require 'data_mapper'
require 'sinatra'

class Link
    include DataMapper::Resource

    property :id    , Serial
    property :title , String
    property :url   , String
end

configure :development do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_development")
end

configure :test do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
end

DataMapper.finalize
DataMapper.auto_upgrade!
