# frozen_string_literal: true

module Queries
  module Lib
    # ...
    module Constructor
      def self.build(&block)
        @klass = Class.new(Queries::Lib::Schema)
        @klass.class_eval do
          @filters = []
          def self.call
            @filters
          end
        end
        @klass.class_eval(&block)
        @klass
      end
    end
  end
end
