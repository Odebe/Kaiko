# frozen_string_literal: true

PersonValidator = Dry::Validation.Schema(BaseModelValidator) do
  required(:name).filled(unique?: :name)
  required(:situations).filled
  required(:avatar).filled(size_less?: 2) # in mb
  optional(:avatar_cache)
end
