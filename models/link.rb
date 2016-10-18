require 'dm-migrations'
require 'dm-postgres-adapter'
require 'data_mapper'
require 'sinatra'
require_relative 'data_mapper_setup'
require_relative 'tag'

class Link
    include DataMapper::Resource

    property :id    , Serial
    property :title , String
    property :url   , String

    has n, :tags, :through => Resource
end
