# frozen_string_literal: true

module Kaiko
  # routes class
  class Routes
    extend Dry::Configurable

    controllers = {
      posts: {
        name: :posts,
        menu: 'Посты',
        path: '/posts',
      },
    }

    setting :controllers_list, controllers.map { |k, _v| k.to_s }, reader: true

    controllers.each do |name, info|
      setting name, reader: true do
        setting :info, info, reader: true
        setting :menu, info[:menu], reader: true
        setting :path, info[:link], reader: true
      end
    end

    def self.by_name(name)
      send(name)
    end
  end
end
