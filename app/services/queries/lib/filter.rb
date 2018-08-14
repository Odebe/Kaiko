# frozen_string_literal: true

module Queries
  module Lib
    class Filter
      attr_reader :option, :default

      def initialize(options)
        @option = options[:name]
        @rule = options[:rule]
        @default = options[:default]
      end

      def call(scope, value)
        @rule.call(scope, value)
      end
    end
  end
end
