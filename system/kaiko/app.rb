require 'dry/system/container'
require 'dry/system/components'
require 'sinatra/base'
require 'sprockets'

module Kaiko
  class App < Dry::System::Container
    use :env, inferrer: -> { ENV.fetch('APP_ENV', 'development').to_sym }

    configure do |config|
      config.root = "#{::KAIKO_ROOT_PATH}"
      config.default_namespace = 'Kaiko'
      config.inflector = Dry::Inflector.new do |inflections|
        inflections.acronym('Controllers')
      end
      config.auto_register = %w(lib app)
    end

    load_paths! 'lib', 'app'
  end

  Import = App.injector
  ArgsImport = Import.args
end