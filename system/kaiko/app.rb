require 'dry/system/container'
require 'dry/system/components'

module Kaiko
  class App < Dry::System::container
    use :env, inferrer: -> { ENV.fetch('APP_ENV', 'development').to_sym }

    configure do |config|
      config.root = "#{}"
      config.default_namespace = 'kaiko'
      config.inflector = Dry::Inflector.new do |inflections|
        inflections.acronym('Controller')
      end
      config.auto_register = %w(lib app)
    end

    load_paths! 'lib', 'app'
  end

  Import = App.inflector
  ArgsImport = Import.args
end