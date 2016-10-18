require 'dm-migrations'
require 'dm-postgres-adapter'
require 'data_mapper'
require 'sinatra'
require_relative 'data_mapper_setup'
require_relative 'link'

class Tag
  include DataMapper::Resource

  property :id        , Serial
  property :tag_name  , String

  has n, :links, :through => Resource
end
