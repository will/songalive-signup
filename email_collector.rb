require 'rubygems'
require 'sinatra'
require 'haml'

require 'signup.rb'

get '/' do
  haml :signup
end

post '/' do
  if Signup.signup(params[:email])
    redirect '/thanks'
  else
    redirect '/'
  end
end

get '/thanks' do
  haml :thanks
end
