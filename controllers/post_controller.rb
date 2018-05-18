module Kaiko
  class PostController < Sinatra::Base

    index_page = lambda do
      "posts\n"
    end 

    show_page = lambda do
      id = params['captures'].first
      "post #{id}"
    end

    new_page = lambda do 
      "123"
    end

    get '/posts', &index_page
    get %r{/posts/(\d+)}, &show_page
    get '/posts/new', &new_page
  end
end