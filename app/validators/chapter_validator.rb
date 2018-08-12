# frozen_string_literal: true

ChapterValidator = Dry::Validation.Schema do
  required(:title).filled
  required(:num).filled
  required(:vol).filled
  required(:project_id).filled
end
