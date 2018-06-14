module Kaiko
  module Controller

    class Base < Kaiko::Controller::Base
      set :views, Kaiko::CONFIG['paths']['views']

      index_page = -> do
        slim '|index', layout: true
      end 

      show_page = -> do
        id = params['captures'].first
        slim :'posts/show', locals: {post_id: id, id: id}, layout: true
      end

      new_page = -> do 
        slim '|new post', layout: true
      end

      get '/posts', &index_page
      get %r{/posts/(\d+)}, &show_page
      get '/posts/new', &new_page
    end

  end 
end
