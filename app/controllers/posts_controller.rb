class PostsController < Sinatra::Base
  set :views, Kaiko::Config.paths['views']

  index_page = -> do
    "posts\n"
    slim '|index',layout: true
  end 

  show_page = lambda do
    id = params['captures'].first
    slim :'posts/show', locals: {post_id: id, id: id}, layout: true
  end

  new_page = lambda do 
    slim '|new post', layout: true
  end

  get '/posts', &index_page
  get %r{/posts/(\d+)}, &show_page
  get '/posts/new', &new_page
end
