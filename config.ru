require 'rubygems'
require 'sinatra'

set :public,   File.expand_path(File.dirname(__FILE__) + '/public') #Include your public folder
set :views,    File.expand_path(File.dirname(__FILE__) + '/views')  #Include the views
set :environment, :production

disable :run, :reload


require 'email_collector'
run Sinatra::Application
