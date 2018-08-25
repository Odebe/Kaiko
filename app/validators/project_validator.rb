# frozen_string_literal: true

ProjectValidator = Dry::Validation.Schema(BaseModelValidator) do
  required(:title).filled(unique?: :title)
  required(:description).filled
  required(:preview)#.filled(size_less?: 5) # in mb
  optional(:preview_cache)
  required(:cover)#.filled(size_less?: 2) # in mb
  optional(:cover_cache)
end
