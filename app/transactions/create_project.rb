# frozen_string_literal: true

class CreateProject
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :validate
  step :create

  private

  def prepare(input)
    prepare_params(input, :project)
  end

  def validate(input)
    res = Validations::Service.call(Project.new(input), input)
    res.success? ? Success(res.success) : Failure(res.messages)
  end

  def create(input)
    record = Project.create(input)
    record.valid? ? Success(record) : Failure(record.errors.messages)
  end
end
