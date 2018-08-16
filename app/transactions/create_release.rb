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
    res = ValidatorService.call(Release, input)
    res.success? ? Success(res.to_h) : Failure(res.messages)
  end

  def create(input)
    result = Release.new(input)
    if result.valid?
      result.save
      Success(result)
    else
      Failure(result.errors.messages)
    end
  end
end
