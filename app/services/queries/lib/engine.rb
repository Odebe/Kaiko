# frozen_string_literal: true

module Queries
  module Lib
    class Engine
      def initialize(init_scope, filters)
        @scope = init_scope
        @filters = filters
      end

      def call(params)
        scope = @scope
        params_with_default_values(params).each do |key, value|
          filter = find_filter(key)
          next if filter.nil?
          scope = filter.call(scope, value)
        end
        scope
      end

      private

      def params_with_default_values(params)
        new_params = params.dup
        @filters.each do |f|
          if new_params[f.option].blank? && f.default.present?
            new_params[f.option] = f.default
          end
        end
        new_params
      end

      def find_filter(option)
        @filters.find { |f| f.option.to_sym == option.to_sym }
      end
    end
  end
end
