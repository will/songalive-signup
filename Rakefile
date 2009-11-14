require 'rubygems'
require 'signup'

desc "put all the emails"
task :email do
  puts "Emails"
  puts
  Signup.all.each do |u|
    puts "#{u.email}\t#{u.why}\t#{u.contact}"
  end
end

task :default => :email

task "email:count" do
  puts "#{Signup.all.size} addresses"
end
