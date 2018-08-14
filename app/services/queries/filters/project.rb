# frozen_string_literal: true

module Queries
  module Filters
    Project = Queries::Lib::Constructor.build do
      filter by: :title, default: :desc do |scope, value|
        scope.order(title: value)
      end
    end
  end
end
