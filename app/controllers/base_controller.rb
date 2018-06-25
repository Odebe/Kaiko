# frozen_string_literal: true

module Kaiko
  module Controllers
    # base routes
    class Base < Sinatra::Base
      set :environment, ::Sprockets::Environment.new
      Kaiko::Settings.assets.list.each do |asset|
        environment.append_path Kaiko::Settings.assets.send(asset)
      end

      # path to assets
      get '/assets/*' do
        env['PATH_INFO'].sub!('/assets', '')
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
