module Kaiko
  class Routes
    @@routes = []

    def self.configure(&block)
      self.instance_eval(&block)
    end

    def self.route(*arg)
      argument = arg.first
      raise Argumenterror unless argument[:controller_name]
      route = {}
      route[:name] = argument[:controller_name] 
      route[:menu] = argument[:menu_name] || argument[:controller_name].capitalize 
      route[:usage] =  argument[:usage] == nil ? true : argument[:usage] 
      #route[:views_path] =  argument[:views_path] == nil ? "#{argument[:controller_name]}" : argument[:usage] 
      @@routes << route
    end  

    def self.routes
      @@routes
    end 

    def self.used_routes
      @@routes.select{ |r| r[:usage] }
    end

    def self.menu_elements
      self.used_routes.map { |r| { r[:menu] => r[:name] } }
    end

  end

end