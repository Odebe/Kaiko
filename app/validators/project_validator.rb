# frozen_string_literal: true

ProjectValidator = Dry::Validation.Schema do
  required(:title).filled
  required(:description).filled
  optional(:preview)
  optional(:preview_cache)
  optional(:cover)
  optional(:cover_cache)
end
