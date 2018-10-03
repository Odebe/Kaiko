# frozen_string_literal: true

class CreateRelease
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :validate
  step :create

  private

  def prepare(input)
    prepare_params(input, :release)
  end

  def validate(input)
    res = ValidatorService.new.call(Release.new(input), input)
    res.success? ? Success(res.success) : Failure(res.failure)
  end

  def create(input)
    record = Release.create(input)
    record.valid? ? Success(record) : Failure(record.errors.messages)
  end
end
