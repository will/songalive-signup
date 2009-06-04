require 'rubygems'
require 'signup'

desc "put all the emails"
task :email do
  puts "Emails"
  puts
  Signup.all.each do |email|
    puts email.email
  end
end

task :default => :email

task "email:count" do
  puts "#{Signup.all.size} addresses"
end