require 'rubygems'
require 'sinatra'
require 'haml'

require 'signup.rb'
require 'email_regex'

get '/' do
  haml :index
end

post '/' do
  email = params[:email]
  
  if email =~ EmailAddress
    "good email"
  else
    "bad email"
  end
  
end
