class PtestController < Sinatra::Base
  set :views, Kaiko::Config.views_path
  
  get '/ptest' do 
    "ptest index"
  end
end