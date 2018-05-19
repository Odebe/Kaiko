class App < Sinatra::Base
  set :environment, Sprockets::Environment.new

  Kaiko::Config.assets_paths.each { |asset_path| environment.append_path asset_path }
  Kaiko::Routes.used_routes.each { |c| use const_get("#{c[:name].capitalize}Controller") }

  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  get '/' do 
    redirect '/posts'
  end
end
