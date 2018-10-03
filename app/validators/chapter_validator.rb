# frozen_string_literal: true

class ChapterValidator < Validations::Base
  SCHEMA = Dry::Validation.Schema(BaseModelValidator) do
    required(:title).filled
    required(:num).filled
    required(:vol).filled
    required(:link).filled(format?: URI::DEFAULT_PARSER.make_regexp)
    required(:project_id).filled(relation?: Project)
    validate(scope_uniq?: %i[num vol project_id]) do |num, vol, project_id|
      !record.class.where.not(id: record.id).where(num: num, vol: vol, project_id: project_id).exists?
    end
  end

  def call(params, with:)
    @valid ? SCHEMA.with(record: with[:record]).call(params).to_monad : Dry::Monads::Failure('meh')
  end
end
