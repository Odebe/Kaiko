class PtestController < Sinatra::Base
  set :views, Kaiko::Config.paths['views']
  
  get '/ptest' do 
    "ptest index"
  end
end