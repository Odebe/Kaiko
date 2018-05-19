require 'sinatra/base'
require 'sprockets'

require './conf/routes.rb'
require './conf/config.rb'

Kaiko::Routes.configure do 
  route controller_name: 'posts', menu_name: 'Посты'
  route controller_name: 'test', usage: false
  route controller_name: 'ptest', usage: true
end

Kaiko::Config.components.each do |component|
  Dir.glob("./app/#{component}/*.rb").each { |file| require file }
end

require './app.rb'
run App