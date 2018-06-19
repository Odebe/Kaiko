# Kaiko::App.boot :settings, from: :system do

#   # gems_list = %w(
#   #   sinatra
#   #   sprockets
#   # )

#   before :init do
#     # gems_list.each do |lib|
#     #   ::Kernel.require lib
#     # end
#   end

#   settings do
#     # key :database_url, Types::Strict::String.constrained(filled: true)
#     # key :config, Kaiko::Settings
#   end
# end

class Kaiko::Settings
  extend Dry::Configurable

  assets_path = 'app/assets'
  assets_list = %w(js css)
  
  setting :assets_path, assets_path  

  setting :assets, reader: true do
    setting :list, assets_list
    assets_list.each do |asset|
      setting asset.to_sym, "#{assets_path}/#{asset}"
    end
  end

  setting :views, reader: true do
    setting :path, 'app/views'
  end
end