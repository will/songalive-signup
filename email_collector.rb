require 'rubygems'
require 'sinatra'
require 'haml'

require 'signup.rb'


get '/' do
  haml :index
end

post '/' do
  Signup.signup(params[:email])
  
  redirect '/thanks'
end

get '/thanks' do
  @thanks = true
  haml :index
end
