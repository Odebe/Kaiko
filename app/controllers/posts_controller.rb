# frozen_string_literal: true

module Kaiko
  module Controllers
    # Routes to handle posts
    class Posts < Kaiko::Controllers::Base
      set :views, Kaiko::Settings.views.path

      get '/' do
        slim '|index', layout: true
      end

      get '/:id' do
        locals = {
          post_id: params['id'],
          id: params['id']
        }
        slim :'posts/show', locals: locals, layout: true
      end

      get '/new' do
        slim '|new post', layout: true
      end
    end
  end
end
