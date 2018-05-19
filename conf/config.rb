require 'yaml'

module Kaiko
  class Config

    def self.file
      @@file
    end

    def self.from_file(filename)
      @@file = YAML.load_file("#{__dir__}/"+filename)
    end

    def self.method_missing(meth, *args, &block)
      if self.file.has_key? meth.to_s
        @@file[meth.to_s]
      else
        super
      end
    end

  end
end