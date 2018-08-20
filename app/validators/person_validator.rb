# frozen_string_literal: true

PersonValidator = Dry::Validation.Schema(BaseModelValidator) do
  required(:name).filled(unique?: :name)
  required(:situations).filled
  required(:avatar)
  optional(:avatar_cache)
end
