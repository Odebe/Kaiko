class App < Kaiko::Controller::Base
  set :environment, Sprockets::Environment.new
  set :assets, Kaiko::CONFIG['paths']['assets']

  # define controllers
  # puts "define controllers"
  set :controllers, do: -> {
    puts "2222222"
    controller 'posts', menu_name: 'Посты'
  }

  puts "321"

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
