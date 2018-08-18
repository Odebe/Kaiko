# frozen_string_literal: true

ReleaseValidator = Dry::Validation.Schema(BaseModelValidator) do
  required(:chapter_id).filled(relation?: Chapter)# unique?: :chapter_id)
  required(:project_id).filled(relation?: Project)
  optional(:published)
  validate(scope_uniq?: %i[chapter_id project_id]) do |chapter_id , project_id|
    !model.where(chapter_id: chapter_id, project_id: project_id).exists?
  end
end
