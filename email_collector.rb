require 'rubygems'
require 'sinatra'
require 'haml'

require 'signup.rb'

get '/' do
  haml :signup
end

post '/' do
  Signup.signup(params[:email])
	redirect '/thanks'
end

get '/thanks' do
  haml :thanks
end
