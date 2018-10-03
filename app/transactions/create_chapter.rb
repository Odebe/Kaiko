# frozen_string_literal: true

class CreateChapter
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :validate
  step :create
  step :create_release

  private

  def prepare(input)
    prepare_params(input, :chapter, [:project])
  end

  def validate(input)
    res = Validations::Service.call(Chapter.new(input), input)
    res.success? ? Success(res.to_h) : Failure(res.messages)
  end

  def create(input)
    result = Chapter.create(input)
    result.valid? ? Success(result) : Failure(result.errors.messages)
  end

  def create_release(input)
    AddReleaseWorker.perform_async(chapter_id: input.id, project_id: input.project.id)
    Success(input)
  end
end
