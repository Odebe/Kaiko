# frozen_string_literal: true

require_relative 'kaiko/app'

root = Kaiko::App.root
# Kaiko::App.start(:settings)

Dir.glob(root.join('system/boot/*.rb')).each { |f| require f }

require root.join('app/controllers/base_controller.rb')
Dir.glob(root.join('app/controllers/*.rb')).each { |f| require f }

Kaiko::App.finalize!
