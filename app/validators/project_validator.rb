# frozen_string_literal: true

ProjectValidator = Dry::Validation.Schema(BaseModelValidator) do
  required(:title).filled(unique?: :title)
  required(:description).filled
  required(:preview)
  optional(:preview_cache)
  required(:cover)
  optional(:cover_cache)
end
