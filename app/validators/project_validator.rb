# frozen_string_literal: true

ProjectValidator = Dry::Validation.Schema do
  required(:title).filled
  required(:description).filled
  required(:preview)
  optional(:preview_cache)
  required(:cover)
  optional(:cover_cache)
end
