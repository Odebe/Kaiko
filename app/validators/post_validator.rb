# frozen_string_literal: true

PostValidator = Dry::Validation.Schema do
  required(:title).filled
  required(:text).filled
  required(:post_type).filled
  required(:project_id).maybe(:int?)
end
