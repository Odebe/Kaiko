# frozen_string_literal: true

module Kaiko
  # settings
  class Settings
    extend Dry::Configurable

    assets_path = 'app/assets'
    assets_list = %w[js css]
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
end
