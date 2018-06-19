module Kaiko
  module Controllers
    class Posts < Kaiko::Controllers::Base
      set :views, Kaiko::Settings.views.path

      get '/' do
        slim '|index', layout: true
      end 

      get '/:id' do
        slim :'posts/show', locals: {post_id: params['id'], id: params['id']}, layout: true
      end

      get '/new' do 
        slim '|new post', layout: true
      end

    end

  end 
end
