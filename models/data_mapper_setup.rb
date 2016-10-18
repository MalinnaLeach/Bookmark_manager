configure :development do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_development")
end

configure :test do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
end

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end
