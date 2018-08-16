# frozen_string_literal: true

ChapterValidator = Dry::Validation.Schema(BaseModelValidator) do
  required(:title).filled
  required(:num).filled
  required(:vol).filled
  required(:project_id).filled(relation?: Project)
  validate(scope_uniq?: %i[num vol project_id]) do |num, vol, project_id|
    !model.where(num: num, vol: vol, project_id: project_id).exists?
  end
end
