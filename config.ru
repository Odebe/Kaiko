require 'sinatra/base'
require 'sprockets'
require 'yaml'

module Kaiko
  CONFIG = YAML.load_file("#{__dir__}/conf/settings.yaml")
end

Kaiko::CONFIG['requires'].each { |path| Dir.glob("./#{path}/*.rb").each { |file| require File.expand_path(file, __dir__) } }
Kaiko::CONFIG['components'].each { |component| Dir.glob("./app/#{component}/*.rb").each { |file| require file } }

puts "123"

require './app.rb'
run App