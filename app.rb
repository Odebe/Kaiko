class App < Sinatra::Base
  set :environment, Sprockets::Environment.new

  # define routes
  Kaiko::Routes.configure do 
    route controller_name: 'posts', menu_name: 'Посты'
    route controller_name: 'test', usage: false
    route controller_name: 'ptest', usage: true
  end

  # path to assets
  Kaiko::Config.paths['assets'].each { |asset_path| environment.append_path asset_path }
  # use for all routes with used: true
  Kaiko::Routes.used_routes.each { |c| use const_get("#{c[:name].capitalize}Controller") }

  # path to assets
  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  # root path
  get '/' do 
    redirect '/posts'
  end
end
