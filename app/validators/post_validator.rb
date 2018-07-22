# frozen_string_literal: true

PostValidator = Dry::Validation.Schema do
  required(:title).filled
  required(:text).filled
  required(:post_type).filled
  optional(:project_id)
end
