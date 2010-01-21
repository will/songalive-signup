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
  get_email
  haml :more
end

post '/more' do
  get_email
  user = Signup.first(:email => @email)
  user.why = params[:why]
  user.contact = params[:contact]
  user.save
  redirect '/thanks'
end

get '/thanks' do
  haml :thanks
end

get '/2TPZ849mN3LAzrUEY5Cp7DuSnGRydt6w1cXWIilBHj0fOqJhsKuq4RAMKd8VFG7BNlcLSQns26DheCPIJfZOtgUYiE5903Xzbj1pbKR1u4LwPlvohfY0CX6TjWJ728mnQkpSIHVeaU5yt3Eri9MFDs' do
  @signups = Signup.all
  haml :list
end

def get_email
  @email = request.cookies['email']
  redirect '/' unless @email
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end
