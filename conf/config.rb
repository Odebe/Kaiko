module Kaiko
  class Config
    #TODO: read from file
    @@file = {
      views_path: "app/views",
      assets_paths: [
        "app/assets/js",
        "app/assets/css",
      ],
      components: %w{ helpers controllers },
    }

    def self.file
      @@file
    end

    def self.method_missing(meth, *args, &block)
      if self.file.has_key? meth
        @@file[meth]
      else
        super
      end
    end
    
  end
end