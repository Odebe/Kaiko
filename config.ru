require_relative 'system/boot'
require 'yaml'

module Kaiko
  CONFIG = YAML.load_file("#{__dir__}/conf.settings.yaml")
end

map('/') { run Kaiko::Controller::Base } 
map('/posts') { run Kaiko::Controller::Posts }
