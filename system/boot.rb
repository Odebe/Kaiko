require_relative 'kaiko/app'

root = Kaiko::App.root

Dir.glob(root.join('system/boot/*.rb')).each { |f| require f }
Dir.glob(root.join('app/kaiko/controllers/*.rb')).each { |f| require f }

Ledger::App.finalize!