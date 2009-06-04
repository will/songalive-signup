require "dm-core"
require "dm-timestamps"
 DataMapper.setup(:default, "sqlite3:///#{Dir.pwd}/emails.db")

class Signup
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  property :email, String, :key => true
  timestamps :at
end