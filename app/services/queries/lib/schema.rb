# frozen_string_literal: true

module Queries
  module Lib
    # ...
    class Schema
      # lambda format ->(scope, value) { ... }
      # lambda should return scope
      def self.filter(opt, &block)
        opt_name = opt[:by]
        res_proc =
          if block_given?
            block
          else
            ->(scope, value) { scope.where(opt_name => value) }
          end
        @filters << Queries::Lib::Filter.new(
          rule: res_proc,
          name: opt_name,
          default: opt[:default]
        )
      end
    end
  end
end
