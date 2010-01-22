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

get '/list' do
  reset_code
  haml :code
end

get '/list/:code' do
  last_code = Code.first.code
  reset_code
  if params[:code] == last_code
    @signups = Signup.all
    haml :list  
  else
    redirect '/'
  end
end

def get_email
  @email = request.cookies['email']
  redirect '/' unless @email
end

def reset_code
  @code = Array.new(12) { ("A".."Z").to_a[rand(26)] }.join
  stored_code = Code.first || Code.new
  stored_code.code = @code
  stored_code.save
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end
