require 'sinatra/base'
require 'sprockets'

Dir.glob("./conf/*.rb").each { |file| require file }

Kaiko::Config.from_file('settings.yaml')

Kaiko::Config.components.each do |component|
  Dir.glob("./app/#{component}/*.rb").each { |file| require file }
end

require './app.rb'
run App