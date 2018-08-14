# frozen_string_literal: true

module Queries
  module Filters
    Release = Queries::Lib::Constructor.build do
      filter by: :project_id
      filter by: :chapter_id # TODO: ", with: project_id"
      filter by: :published

      filter by: :created_at, default: :desc do |scope, value|
        scope.order(created_at: value)
      end

      filter by: :page, default: 0 do |scope, value|
        scope.page(value)
      end
    end
  end
end
