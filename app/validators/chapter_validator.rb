# frozen_string_literal: true

ChapterValidator = Dry::Validation.Schema(BaseModelValidator) do
  required(:title).filled
  required(:num).filled
  required(:vol).filled
  required(:link).filled(format?: URI::DEFAULT_PARSER.make_regexp)
  required(:project_id).filled(relation?: Project)
  validate(scope_uniq?: %i[num vol project_id]) do |num, vol, project_id|
    !record.class.where.not(id: record.id).where(num: num, vol: vol, project_id: project_id).exists?
  end
end
