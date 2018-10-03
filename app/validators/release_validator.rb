# frozen_string_literal: true

class ReleaseValidator < Validations::Base
  SCHEMA = Dry::Validation.Schema(BaseModelValidator) do
    required(:chapter_id).filled(relation?: Chapter, unique?: :chapter_id)
    required(:project_id).filled(relation?: Project)
    optional(:published)
    validate(scope_uniq?: %i[chapter_id project_id]) do |chapter_id , project_id|
      !record.class.where.not(id: record.id).where(chapter_id: chapter_id, project_id: project_id).exists?
    end
  end

  def call(params, with:)
    @valid ? SCHEMA.with(record: with[:record]).call(params).to_monad : Dry::Monads::Failure('meh')
  end
end
