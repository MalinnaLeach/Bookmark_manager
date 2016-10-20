require 'dm-migrations'
require 'dm-postgres-adapter'
require 'data_mapper'
require 'sinatra'
require 'bcrypt'
require_relative 'data_mapper_setup'
require_relative 'tag'
require_relative 'link'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password, String

  def encrypt_password(password)
      BCrypt::Password.create(password.to_s)
  end

  has n, :links, :through => Resource
  has n, :tags, :through => Resource
end
