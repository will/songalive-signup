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
    redirect '/more'
  else
    redirect '/'
  end
end

get '/more' do
  get_eamil
  haml :more
end

post '/more' do
  get_email

end

get '/thanks' do
  haml :thanks
end

def get_email
  @email = request.cookies['email']
  redirect '/' unless @email
end
