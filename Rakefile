desc "put all the emails"
task :email do
  require 'rubygems'
  require 'signup'
  puts "Emails"
  puts
  Signup.all.each do |email|
    puts email.email
  end
end

task :default => :email