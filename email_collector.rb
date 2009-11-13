require 'rubygems'
require 'sinatra'
require 'haml'

require 'signup.rb'

get '/' do
  haml :signup
end

post '/' do
  @email = params[:email]
  if Signup.signup(@email)
    set_cookie("email", @email)
    redirect '/thanks'
  else
    redirect '/'
  end
end

get '/more' do
  @email = request.cookies['email']
  redirect '/' unless @email
end


get '/thanks' do
  haml :thanks
end
