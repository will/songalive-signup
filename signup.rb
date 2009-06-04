require 'email_regex'
require "dm-core"
require "dm-timestamps"

DataMapper.setup(:default, "sqlite3:///#{Dir.pwd}/emails.db")

class Signup
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  property :email, String, :key => true
  timestamps :at
  
  def self.signup(email)
    self.create(:email => email) if email =~ EmailAddress
  end
end

Signup.auto_upgrade!