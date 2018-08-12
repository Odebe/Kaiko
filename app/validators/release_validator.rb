# frozen_string_literal: true

ReleaseValidator = Dry::Validation.Schema do
  required(:chapter_id).filled
  optional(:published)
end
