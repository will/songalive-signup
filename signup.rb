require 'email_regex'
require "dm-core"
require "dm-timestamps"
require "dm-validations"

DataMapper.setup(:default, "sqlite3:///#{Dir.pwd}/emails.db")

class Signup
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  property :email, String, :key => true
  property :why, Text
  property :contact, Text

  timestamps :at
  validates_is_unique :email
  
  def self.signup(email)
    self.create(:email => email) if email =~ EmailAddress
  end
end

Signup.auto_upgrade!
