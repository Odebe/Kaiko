require 'sinatra/base'

@kaiko_env = { components: {} }
%w{ helpers controllers }.each do |component|
  Dir.glob("./#{component}/*.rb").each do |file| 
    require file
    @kaiko_env[:components][component.to_sym] ||= []
    component_name = File.basename(file).sub('.rb','').split('_').map(&:capitalize).join
    @kaiko_env[:components][component.to_sym] << component_name
  end
end

puts @kaiko_env

require './app.rb'

run Kaiko::App