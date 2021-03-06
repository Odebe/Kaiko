# frozen_string_literal: true

module Queries
  module Filters
    User = Queries::Lib::Constructor.build do
      filter by: :created_at, default: :desc do |scope, value|
        scope.order(created_at: value)
      end

      filter by: :page, default: 1 do |scope, value|
        scope.page(value)
      end
    end
  end
end
