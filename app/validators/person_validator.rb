# frozen_string_literal: true

PersonValidator = Dry::Validation.Schema(BaseModelValidator) do
  required(:name).filled(unique?: :name)
  required(:situations).filled
end
