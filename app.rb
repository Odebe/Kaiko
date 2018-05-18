require 'sinatra/base'

module Kaiko

  class App < Sinatra::Base
    use Kaiko::PostController

    get '/' do 
      redirect '/posts'
    end
  end

end
