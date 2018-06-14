module Kaiko
  module Controller
    class Manager
      @@routes = []

      def self.routes
        @@routes
      end 

      def self.used
        @@routes.select{ |r| r[:usage] }
      end

      def self.menu_elements
        self.used.map { |r| { r[:menu] => r[:name] } }
      end

      private

      def self.controller(cname, options = {})
        raise Argumenterror unless cname
        route = {}
        route[:name] = cname 
        route[:menu] = options[:menu_name] || options[:controller].capitalize 
        route[:usage] =  options[:usage] == nil ? true : options[:usage] 
        #route[:views_path] =  argument[:views_path] == nil ? "#{argument[:controller_name]}" : argument[:usage] 
        @@routes << route
      end  

    end
  end
end

module Kaiko
  module Controller
    class Base < Sinatra::Base

      def self.methods_to_set
        %w( controllers assets )
      end

      def self.set(key, options = {})
        puts key
        puts options.to_s
        # if Kaiko::Controller::Base.methods_to_set.include? key.to_s
        #   puts key.to_s
        #   (options[:do] == nil) ? send(key, options) : send(key, options, options.delete(:do))
        # else
        #   super
        # end
      end

      private

      def self.controllers(params, &block)
        Kaiko::Controller::Manager.instance_eval(&block)
        Kaiko::Controller::Manager.used.each { |c| use const_get("#{c[:name].capitalize}Controller") }
      rescue NameError
        puts "meeeh"
      end

      def self.assets(paths)
        paths.each { |asset_path| environment.append_path asset_path }
      end
    end
  end
end