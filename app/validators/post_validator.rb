# frozen_string_literal: true

PostValidator = Dry::Validation.Schema do
  required(:title).filled
  required(:text).filled
  optional(:status)
end

