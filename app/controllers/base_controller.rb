require 'sinatra/base'

module Kaiko
  module Controller
    class Base < Sinatra::Base
      set :environment, Sprockets::Environment.new
      Kaiko::CONFIG['paths']['assets'].each { |asset_path| environment.append_path asset_path }

      # path to assets
      get "/assets/*" do
        env["PATH_INFO"].sub!("/assets", "")
        settings.environment.call(env)
      end

      # root path
      get '/' do 
        redirect '/posts'
      end

      not_found do 
        '404'
      end 
    end
    
  end 
end
